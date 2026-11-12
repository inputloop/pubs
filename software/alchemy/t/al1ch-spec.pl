#!/usr/bin/perl
# al1ch-spec.pl -- the second reader of an alchemy deck (spec: c4/man/al1ch.md). It reads the atoms
# itself, writes the fold and the check's summary its own way, and compares both with h/al1ch's, byte
# for byte. Usage: perl t/al1ch-spec.pl [DECK-FOLDER...]   (default: every deck under alchemy/decks)
#                  perl t/al1ch-spec.pl --prove-red       (each planted fault: both readers red, together)
# Copyright 2026 INPUTLOOP; Corwin Brust <corwin@bru.st>, Bryant Frankford and Contributors;
# GPL-3.0-or-later OR LGPL-3.0-or-later. Mentat (for Corwin, claude-opus-5-5)
use strict; use warnings;
use File::Basename qw(dirname basename);
use File::Temp qw(tempdir);
use File::Path qw(make_path remove_tree);
use Cwd qw(abs_path);
$ENV{LC_ALL} = 'C';
my $c4 = abs_path(dirname(abs_path($0)) . '/..');
my $tool = "$c4/h/al1ch";

sub slurp { my ($f) = @_; open(my $h, '<', $f) or return undef; local $/; my $t = <$h>; close $h; $t }
sub lines { my $t = slurp($_[0]); return () unless defined $t && length $t; my @l = split /\n/, $t, -1; pop @l if $t =~ /\n\z/; @l }
sub ls { my ($d) = @_; opendir(my $h, $d) or return (); my @e = sort grep { !/^\./ } readdir $h; closedir $h; @e }

sub read_deck {
  my ($d) = @_; my %k = (name => basename($d), bad => []);
  my @about = lines("$d/about");
  ($k{title}) = map { /^title: *(.*)/ ? $1 : () } @about; $k{title} //= '';
  my ($i) = grep { $about[$_] eq '' } 0..$#about;
  $k{says} = ''; if (defined $i) { for my $l (@about[$i+1..$#about]) { if ($l =~ /\S/) { $k{says} = $l; last } } }
  $k{start} = [ grep { -f "$d/start/$_" } ls("$d/start") ];
  $k{names} = { map { $_ => (lines("$d/names/$_"))[0] // '' } grep { -f "$d/names/$_" } ls("$d/names") };
  for my $a (ls("$d/rx")) { for my $b (ls("$d/rx/$a")) { my @l = lines("$d/rx/$a/$b");
      push @{$k{rx}}, { a => $a, b => $b, p => $l[0] // '', w => $l[1] // '', n => scalar(@l) } } }
  $k{rx} ||= []; \%k
}

sub fold_of {
  my ($k) = @_; my @o = ("about\t$k->{name}\t$k->{title}\t$k->{says}");
  push @o, map { "start\t$_" } sort @{$k->{start}};
  push @o, sort map { "name\t$_\t$k->{names}{$_}" } keys %{$k->{names}};
  push @o, sort map { "rx\t$_->{a}\t$_->{b}\t$_->{p}\t$_->{w}" } @{$k->{rx}};
  join('', map { "$_\n" } @o)
}

sub levels {   # fewest combinations from first matter
  my ($k) = @_; my %lv = map { $_ => 0 } @{$k->{start}}; my $ch = 1;
  while ($ch) { $ch = 0; for my $r (@{$k->{rx}}) {
      next unless exists $lv{$r->{a}} && exists $lv{$r->{b}};
      my $l = ($lv{$r->{a}} > $lv{$r->{b}} ? $lv{$r->{a}} : $lv{$r->{b}}) + 1;
      if (!exists $lv{$r->{p}} || $l < $lv{$r->{p}}) { $lv{$r->{p}} = $l; $ch = 1 } } }
  \%lv
}

sub verdict {   # 'OK summary' or 'NOT OK' -- the spec's seven promises, read independently
  my ($k) = @_; my $id = qr/^[a-z0-9]+$/; my $bad = 0;
  $bad++ unless length $k->{title} && length $k->{says};
  $bad++ if grep { $_ !~ $id } (@{$k->{start}}, keys %{$k->{names}});
  $bad++ unless @{$k->{start}};
  my %start = map { $_ => 1 } @{$k->{start}}; my %el = %start; my %used;
  for my $r (@{$k->{rx}}) {
    $bad++ if $r->{a} !~ $id || $r->{b} !~ $id || $r->{p} !~ $id;
    $bad++ if $r->{a} gt $r->{b};
    $bad++ if $r->{n} != 2 || $r->{w} eq '';
    $bad++ if $start{$r->{p}};
    $el{$r->{p}} = 1; $used{$r->{a}} = $used{$r->{b}} = 1;
  }
  my $lv = levels($k);
  $bad++ if grep { !exists $lv->{$_->{a}} || !exists $lv->{$_->{b}} } @{$k->{rx}};
  $bad++ if grep { !$el{$_} } keys %{$k->{names}};
  return "al1ch check $k->{name}: NOT OK" if $bad;
  my ($dp) = sort { $b <=> $a } values %$lv;
  my $de = grep { !$start{$_} && !$used{$_} } keys %el;
  sprintf("al1ch check %s: %d elements (%d first matter), %d reactions, depth %d, %d dead ends: OK",
          $k->{name}, scalar(keys %$lv), scalar(@{$k->{start}}), scalar(@{$k->{rx}}), $dp, $de)
}

sub theirs { my @c = @_; open(my $h, '-|', 'sh', $tool, @c) or die "cannot run $tool"; local $/; my $t = <$h> // ''; close $h; $t }

sub compare {   # returns (agree?, my verdict line)
  my ($d) = @_; my $k = read_deck($d); my $mine = verdict($k);
  my $fold_ok = fold_of($k) eq theirs('fold', $d);
  my @their = split /\n/, theirs('check', $d);
  my $agree = $fold_ok && @their && $their[-1] eq $mine;
  print(($agree ? "  agree: " : "  DISAGREE: ") . "$mine\n");
  print "    fold differs\n" unless $fold_ok;
  print "    al1ch said: $their[-1]\n" if !$agree && @their;
  ($agree, $mine)
}

if (@ARGV && $ARGV[0] eq '--prove-red') {
  my $t = tempdir(CLEANUP => 1); my $fails = 0;
  my $mk = sub { my ($n) = @_; my $d = "$t/$n"; remove_tree($d); make_path("$d/start", "$d/rx/air", "$d/rx/energy", "$d/names");
    my $w = sub { open(my $h, '>', "$d/$_[0]") or die; print $h $_[1]; close $h };
    $w->('about', "title: Red\n\nA deck made to be broken.\n"); $w->('start/air', "first\n"); $w->('start/fire', "first\n");
    $w->('rx/air/fire', "energy\nAir feeds fire.\n"); $w->('rx/energy/fire', "light\nEnergy that glows.\n"); $w->('names/light', "the light\n"); ($d, $w) };
  my @plants = (
    ['clean deck', sub {}, 1],
    ['bad ID', sub { rename("$_[0]/rx/air/fire", "$_[0]/rx/air/Fire") }, 0],
    ['pair out of order', sub { make_path("$_[0]/rx/fire"); rename("$_[0]/rx/air/fire", "$_[0]/rx/fire/air") }, 0],
    ['third line', sub { $_[1]->('rx/air/fire', "energy\nwhy\nextra\n") }, 0],
    ['no why', sub { $_[1]->('rx/air/fire', "energy\n") }, 0],
    ['no title', sub { $_[1]->('about', "\n\n") }, 0],
    ['makes first matter', sub { $_[1]->('rx/energy/fire', "fire\nCircular.\n") }, 0],
    ['never fires', sub { make_path("$_[0]/rx/ghost"); $_[1]->('rx/ghost/ghost', "boo\nNever.\n") }, 0],
    ['name for nothing', sub { $_[1]->('names/nobody', "nobody\n") }, 0],
  );
  my $i = 0;
  for my $p (@plants) { my ($d, $w) = $mk->('p' . $i++); $p->[1]->($d, $w);
    my ($agree, $mine) = compare($d); my $green = $mine =~ /: OK$/ ? 1 : 0;
    my $ok = $agree && $green == $p->[2];
    print(($ok ? "  held:  " : "  FAILED: ") . "$p->[0]\n"); $fails++ unless $ok }
  print $fails ? "PROVE-RED FAILED: $fails\n" : "PROVE-RED OK\n"; exit($fails ? 1 : 0);
}

my @decks = @ARGV ? @ARGV : map { "$c4/alchemy/decks/$_" } grep { -f "$c4/alchemy/decks/$_/about" } ls("$c4/alchemy/decks");
my $bad = 0; for my $d (@decks) { my ($agree, $mine) = compare($d); $bad++ unless $agree && $mine =~ /: OK$/ }
print $bad ? "AL1CH SPEC: $bad deck(s) disagree or fail\n" : "AL1CH SPEC: both readers agree\n"; exit($bad ? 1 : 0);
