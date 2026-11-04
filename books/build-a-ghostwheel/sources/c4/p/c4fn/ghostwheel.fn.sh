#!/usr/bin/bash
# C4 functions for the ghostwheel @@&<_f @@
# Copyright (C)2026 Corwin Brust <corwin@brust>
# GPLv3+: The program is Free Software
#
# This is a bootstrapping file, used in RC et. al.
# - Do not depend on functions not defined herein
# - Obey existing values when settings variables
# - Ensure critical variables are initialized
# - Emit warnings about problems; no dying
#

####
##  Tests - forensenices and disaster avoidance
##    Each test has a name is assicated with a run-level and set
##    allowing us several ways to conveniently check that required
##    functionality is without detectated error condition.

## NOTE:
## Test scaffolding must come *before* everything (e.g. utility
## functions), reenforsing the need to separately implement tests.

# (delete variable) unset run level indicates startup hasn't finished
declare -p C4_RUN >/dev/null 2>&1 && unset C4_RUN;

# (overwrite register integer) C4_T - assoicative array TAG => TAGS
declare -p C4_T >/dev/null 2>&1 && unset C4_T;
declare -A C4_T=([0]= )

# (overwrite register integer) C4_LASTRUN - prior run-level, if any
declare -p C4_LASTRUN >/dev/null 2>&1 && unset C4_LASTRUN;
declare -i C4_LASTRUN=${C4_RUN--1};

# (delayed overwrite register) system runlevel
# 0..boostraping
# 1..containers
# 2..components
# 3..configurations
# 4..connections
# 5..running
declare -p C4_RUN >/dev/null 2>&1 && unset C4_RUN;

# (overwrite register) test register
declare C4_TR='T'

# (overwrite register integer) total count of tests
declare -i C4_TN=-1; # test function will be patient zero

# (required) honor customization of OK/FAIL labels
C4_T_OKAY="${C4_T_OKAY-OKAY}"
C4_T_FAIL="${C4_T_FAIL-FAIL}"

####
## Lab:  this ugly beast merges bash associate arrays
# (c=(`unset a b c; \
#      declare -A a=([b]="bb" [c]="cc"); \
#      declare -A b=([d]="dd"); declare -p a b | \
# 	   perl -e '@a= map { chomp; s/^.*=\(|\)$//g; $_ } <>; print qq(@a)' \
#     `); declare -p c)
## :Lab declare -A c=(["[c]=\"cc\" [b]=\"bb\"  [d]=\"dd\" "]="" )
####
## Lab: this one can let us pass functions around
# (foo="$(declare -fx foo; \
#	  function foo { \
#           echo hello;\
#         } ; \
#         export -pf foo; \
#           declare -pf foo; \
#  )" ; \
#  eval "$foo"; \
#  foo )
## :Lab hello;
####

#### c4.f.dval
###  output assignments from bash arrays
###  (unset a b c; \
###    declare -A a=([b]="bb" [c]="cc"); \
###    declare -A b=([d]="dd");\
###    echo $( c4.f.dval a b ) )
function c4.f.dval {
    declare -p $@ | perl -e '
      # combine assignments: 
      $\=q( );    # 1. join ouput on space
      print map { # 6. output the line
          chomp;  # 3. rm -f newline
          s/^.*=\(|\)$//g; # 4. extract assignments
          $_      # 5. use value (not replacment count)
      } <>'       # 2. walk input from declare -p
}
#### -END c4.f.dval


#### c4.f.prgs_Array -
###  create associative array from (quoted) name list and args
function c4.f.pargs {
    declare -la rv=()
    while test -n "$1" ; do
	rv+=$1; shift
    done
    c4.f.dval rv
}
#### -END c4.f.pargs_Array

#### c4.f.sargs_Array -
###  create array from (quoted) string list
function c4.f.sargs {
    local -a rv;
    local -i i=0;
    for arg in $1 ; do
	rv+=$arg;
    done
    c4.f.dval rv
}
#### -END c4.f.sargs

#### c4.f.nrgs_Array -
###  create associative array from (quoted) name list and args
#(eval "declare -lA v=($( . ghostwheel.fn.sh; c4.f.nargs "a b" "c" "d" ))"; echo "${v[a]}") #c
function c4.f.nargs {
    local names="$1"; shift;
    local -A rv;
    local n; for n in $names ; do
	rv[$n]="$1";
	shift;
    done
    c4.f.dval rv
}
#### -END c4.f.pargs_Array

function c4.t.b {
    C4_TN=$((++C4_TN))

    local -A ta=(
	[tn]=$C4_TN
	[okrv]=0 [okay]="$C4_T_OKAY" [fail]="$C4_T_FAIL"
	[tags]="$1" [runl]="$2"	[name]="$3" [desc]="$4"
    ); shift 4;

    # pick the first non-empty tag as a prefix
    for t in ${ta[tags]} ; do
	if test -n "$t" ; then
	    ta[ftag]="$t";
	    break;
	fi
    done

    # make test function name
    ta[fname]="$( printf 'C4%s_%s_%s' "$C4_TR" "${ta[ftag]^^}" "${ta[name]^^}" )"

    # add test to full and by- run-level lists
    C4_T["${ta[runl]}"]+="${ta[fname]}"
    for v in ${ta[tags]} ; do
	C4_T["$v"]+="${ta[fname]}";
    done
    C4_T["${ta[fname]}"]=

    source /dev/stdin <<EOF
function ${ta[fname]}()
{
  $( declare -p ta )
  local debug=\${ta[debug]:-\$C4_DEBUG}

  $@ >/dev/null 2>&1
  local rv="\$?"
  C4_T[${ta[fname]}]=\$rv

  if test \${ta[okrv]} -eq "\$rv" ; then
    if test -n "\$debug" ; then
      printf '%s%d %03d %-17s .. %s : %s'"\\n"           \\
             "\${ta[ftag]^^}"  \${ta[runl]}   \${ta[tn]}    \\
             "\${ta[name]}" "\${ta[okay]}" "\${ta[desc]}" >&2
    fi
  else
      printf '%s%d %03d %-17s .. %s : %s'"\\n"           \\
             "\${ta[ftag]^^}"  \${ta[runl]}   \${ta[tn]}    \\
             "\${ta[name]}" "\${ta[fail]}" "\${ta[desc]}" >&2
  fi

  return \$rv;
};#$( test ${C4_RUN-0} -ge "${ta[runl]}" && printf "\n%s\n" "${ta[fname]}" )
EOF

}
# args and generated, not customizable
c4.t.b "t" 0 "tbuild"                 \
             "args+gen'ed not custom"  \
       test 0 -eq '"${ta[tn]}"'         \
         -a 0 -eq '"${ta[runl]}"'        \
         -a '"${ta[ftag]}"' == '"t"'      \
         -a '"${ta[name]}"' == '"tbuild"'  \
         -a '"${ta[fname]}"' == '"C4T_T_TBUILD"' \
	 -a '"${ta[desc]}"' == '"args+gen'"'"'ed not custom"'

#echo "RV:${C4_TN[C4T_T_B]}"
#c4.t.b "t" 0 "false" "negitive" export fail=\"'OKAY'\" \; false
#C4T_T_FALSE

## END Tests
####

## settings

declare C4_DEBUG #=${C4_DEBUG:-1}

# honor override of system primiary
C4_SG=${C4_SG-gw14}

# honor override of mount name
C4_SI=${C4_SI-storage}

C4_SPOKES=${C4_SPOKES-/spokes}

C4_SYSID=${C4_SYSID-c4}

# honor override of c4 root
C4_ROOT=${C4_ROOT-"$C4_SPOKES/$C4_SG/$C4_SI/$C4_SYSID"}

# honor primary semaphore overrides
C4_AS=${C4_AS-$C4_ROOT/a} # asset
C4_CS=${C4_CS-$C4_ROOT/c} # command
C4_DS=${C4_DS-$C4_ROOT/d} # document
C4_ES=${C4_ES-$C4_ROOT/e} # environment
C4_FS=${C4_FS-$C4_ROOT/f} # feature
C4_GS=${C4_GS-$C4_ROOT/g} # graph
C4_HS=${C4_HS-$C4_ROOT/h} # heap
C4_IS=${C4_IS-$C4_ROOT/i} # identity
C4_JS=${C4_JS-$C4_ROOT/j} # job
C4_LS=${C4_LS-$C4_ROOT/l} # link
C4_MS=${C4_MS-$C4_ROOT/m} # mapping
C4_OS=${C4_OS-$C4_ROOT/o} # object
C4_PS=${C4_PS-$C4_ROOT/p} # package
C4_RS=${C4_RS-$C4_ROOT/r} # register
C4_SS=${C4_SS-$C4_ROOT/s} # subscription
C4_TS=${C4_TS-$C4_ROOT/t} # taxonomy
C4_WS=${C4_WS-$C4_ROOT/w} # workspace

# honor override of hostname
C4_GW=${C4_GW-$(hostname -s)}

# honor override of gateway number
C4_GN=${C4_GN:-"$(printf '%s' "$C4_GW" | tr -d '[[:alpha:]]')"}

# honor override of identity domain
C4_ID=${C4_ID:-bru.st}

# hard code a list of vars into the "not empty" test
for v in "C4_ID" "C4_ROOT" "C4_AS" "C4_GW"; do
    c4.t.b "v" 0 "$v" "non-empty" test -n '"$'"$v"'"'
done
c4.t.b "v" 0 "C4_GN" "positive integer" test 0 -lt '"$C4_GN"'
c4.t.b "v" 0 "C4_ID" "DNS suffex non-empty" test -n '"$C4_GN"'

C4_RUN=0 # only run tests which can indicate startup issues

## Notes:
# More library functions we need:
# [ ] TODO logging functions (formatting + update registers)
# [ ] TODO option to always print tests output

####
## LIBRARY

###  UTILITY

##  print the first non empty input
function c4.s.first {
    for _s_first_i in "$@" ; do
	if test -n "$_s_first_i" ; then
	    printf '%s' "$_s_first_i"
	    break
	fi
    done
}
c4.t.b "s" 0 "first" "[ x z] == x" test "x" == '$( c4.s.first "" "$foo" "x" "z" )'

##  Return first non-empty item matching PATTERN from SET
##  when NEGATE is ! or NOT return first non-empty, non-
##  matching item.
function c4.s.firstmatch {
    _s_firstmatch_ng=
    _s_firstmatch_an=
    if [[ "$1" =~ "!" ]] || [[ "${1^^}" =~ "NOT" ]] ; then
	_s_firstmatch_ng=1; shift
    fi
    if [[ "$1" =~ "^" ]]  ; then
	_s_firstmatch_an="C4C4C4C4"; shift
    fi
    _s_firstmatch_re=$1 ; shift;

    for _s_firstmatch_i in "$@" ; do
	if [[ "$_s_firstmatch_an$_s_firstmatch_i" \
		  =~ "$_s_firstmatch_an$_s_firstmatch_re" ]] ; then
	    if test -z "$_s_firstmatch_ng" -a \
		    -n "$_s_firstmatch_i";  then
		# non-negatated match!
		printf '%s' "$_s_firstmatch_i"
		break
	    fi
	elif test -n "$_s_firstmatch_ng" -a \
		  -n "$_s_firstmatch_i"; then
	    # negigated miss!
	    printf '%s' "$_s_firstmatch_i"
	    break
	fi
    done
}
c4.t.b "s" 0 "firstmatch" "[x o x] == x" test "x" == '"$( c4.s.firstmatch "x" "o" "x" )"'
c4.t.b "s" 0 "firstmatch" "[!x  x o] == o" test "o" == '"$( c4.s.firstmatch "!" "x" "" "x" "o" )"'

##  give a friendly "did it work?" report
##  TODO supress ANSI color-codes when STDOUT isn't a TTY
_c4_updn_ng=1  # when set, empty $up value is a failure

_c4_updn_bl="DOWN ERROR FAILED"  # bad word list
_c4_updn_gl="UP OK" # good word list

_c4_updn_b="DOWN"   # failure output label
_c4_updn_g="UP"     # success output label

_c4_updn_nc="36"    # name output color
_c4_updn_bc="33"    # failure output color
_c4_updn_gc="32"    # success output color

function c4.updn {
    local C4_UPDN_NG="${C4_UPDN_NG:-$_c4_updn_ng}"
  
    local C4_UPDN_BL="${C4_UPDN_BL:-$_c4_updn_bl}"
    local C4_UPDN_GL="${C4_UPDN_GL:-$_c4_updn_gl}"
    
    local C4_UPDN_B="${C4_UPDN_B:-$_c4_updn_b}"
    local C4_UPDN_G="${C4_UPDN_G:-$_c4_updn_g}"
    
    local C4_UPDN_NC="${C4_UPDN_NC-$_c4_updn_nc}"
    local C4_UPDN_BC="${C4_UPDN_BC-$_c4_updn_bc}"
    local C4_UPDN_GC="${C4_UPDN_GC-$_c4_updn_gc}"
    
    local what=$1
    local up=$2
    local msg=$3
    local _c4_updn_up=
    local _c4_updn_dw=

    if test -n "$up" ; then 
	for _c4_updn_i in $C4_UPDN_BL ; do
	    if [[ "$up" =~ "$_c4_updn_i" ]] ; then
		_c4_updn_dw=1
		break
	    fi
	done
	if test -z "$_c4_updn_dw" ; then
	    for _c4_updn_i in $C4_UPDN_GL ; do
		if [[ "$up" =~ "$_c4_updn_i" ]] ; then
		    _c4_updn_up=1
		    break
		fi
	    done
	    if test -z "$_c4_updn_up$C4_UPDN_NG" ; then		
		_c4_updn_dw=1
	    fi
	fi
    elif test -n "$_c4_updn_ng" ; then
	_c4_updn_dw=1
    fi
    if test -z "$_c4_updn_dw" ; then
	up="$C4_UPDN_G"
	color="$C4_UPDN_GC"
    else
	up="$C4_UPDN_B"
	color="$C4_UPDN_BC"
    fi
    if test -n "$msg" ; then
	msg="	$msg"
    fi
    echo -e "Load \e[1;${C4_UPDN_NC}m${what}\e[0m [\e[1;${color}m${up}\e[0m]$msg"
}

###  SYSUTIL
#( function foo { declare -p; }; foo)

##  print hostname if current (or given) file is on a spoke
function c4.s.host {
    _s_host="$1";
    if test -z "$_s_host" ; then
	_s_host="$0"
    fi

    _on_spoke=
    until test -n "$_on_spoke" \
	       -o -z "$_s_host" \
	       -o '.' == "$_s_host" \
	       -o '/' == "$_s_host" ;
    do
	if test -d "$_s_host" -a -r "$_s_host/.spoke" ; then
	    _on_spoke=1
	fi
	_s_host="$(dirname "$_s_host")"
    done
    test -n "$_s_host" && printf '%s' "$(basename "$_s_host")"
}
c4.t.b "s" 0 \
       "host" "\$0 == gw14" test \
       '"$( c4.s.host /spokes/gw14/storage/c4/ghostwheel.fn.sh )"' == '"gw14"'

##   c4.fqn [ GW [ DOMAIN ]]
##   Output the fully qualfied hostname
## Integration Tests:
##   @@tf: "@@C4_GW@@.@@C4_IS@@" == "$( hostname -f )" @@
##   @@ta: "@@C4_GW@@.@@C4_IS@@" == "@@].[[C4][GW ID]]@@" @@
function c4.fqn {
    if test -n "$2" || test -n "$C4_ID" ; then
	if test -n "$1" || test -n "$C4_GW" ; then
	    printf '%s.%s' "${1:-$C4_GW}" "${2:-$C4_ID}"
	else
	    printf '%s.%s' "$(hostname -s)" "${2:-$C4_ID}"
	fi
    elif test -n "$1" || test -n "$C4_GW" ; then
	printf '%s.%s' "${1:-$C4_GW}"
    else
	printf '%s' "$(hostname -f)"
    fi
}
## Unit Tests:
c4.t.b "s" 0 "fqn" \
       "\$0 == gw14" test \
       '"$( c4.fqn foo bar )"' == 'foo.bar'
c4.t.b "s" 0 "fqn_hostname" \
       "C4.fqn == \`hostname -f\`" test \
       '"$( c4.fqn )"' == '"$(hostname -f)"'
# FIXME: fqn seems badly broken
# c4.t.b "s" 0 "fqn_hostname" \
#        "C4.fqn == \`hostname -f\`" test \
#        '"$( c4.fqn )"' == '"$(hostname -s)$C4_GW"'
#### END c4.fqn

# return zero if given HOST is the localhost
function c4.gw_is_localhost {
    if test -z "$1" ; then
	return 1;
    fi

    local _c4_hi=$1; shift;
    local _c4_hs=

    if echo "$_c4_hi" | grep \. 1>/dev/null ; then
	# TODO: could be smarter, given e.g. x.gw10.foo and is10 are gw10
	_c4_hs="$( echo "$_c4_hi" | cut -d '.' -f 1 )"
    else
	_c4_hs="$_c4_hin";
    fi
    if test "$C4_GW" == "$_c4_hs" ; then
	return 0;	
    fi

    return 1;
}
# c4.t.b "s" 0 \
#        "host" "\$0 == gw14" test \
#        '' == ''
c4.t.b "s" 0 "gw_is_localhost_f" "== hostname -f" test "0" == '"$(c4.gw_is_localhost `hostname -f`; echo "$?")"' 
c4.t.b "s" 0 "gw_is_localhost" "== hostname -s" test "0" == '"$(c4.gw_is_localhost `hostname -s`; echo "$?")"' 
c4.t.b "s" 0 "name" "!= moo" test "1" == '"$(c4.gw_is_localhost "moo"; echo "$?")"' 


### IDENTITY
###  - bootstrapping
C4_TR='I'
#c4.t.b 

#seq $( c4.i.val $(c4.i.of gn min) ) $( c4.i.val $(c4.i.of gn max) )

C4_I_GN_MIN=
function c4.i.gn_min () {
    if test -n "$1" -o -z "$C4_I_GN_MIN"; then
	C4_I_GN_MIN=$( c4.i.val $(c4.i.of gn min) )
    fi
    printf '%d' $C4_I_GN_MIN
}

C4_I_GN_MAX=
function c4.i.gn_max () {
    if test -n "$1" -o -z "$C4_I_GN_MAX"; then
	C4_I_GN_MAX=$( c4.i.val $(c4.i.of gn max) )
    fi
    printf '%d' $C4_I_GN_MAX
}

C4_I_GN_SKIP=
function c4.i.gn_skip {
    if test -n "$1" -o -z "$C4_I_GN_SKIP"; then
	C4_I_GN_SKIP="$(c4.i.vals gn skip)";
    fi
    echo $C4_I_GN_SKIP
}

C4_I_GN_SKIPPED=()
function c4.i.gn_skipped {
    local gn=$1;
    if test -z "$C4_I_GN_SKIPPED"; then
	C4_I_GN_SKIPPED[$gn]=1
	if test -n "$gn" \
		-a 0 -lt "$gn" \
		-a $(c4.i.gn_min) -le "$gn" \
		-a $(c4.i.gn_max) -ge "$gn" \
		>/dev/null 2>&1; then
	    C4_I_GN_SKIPPED[$gn]=0
	    local n;
	    for n in $(c4.i.gn_skip) ; do
		if test "$gn" == "$n" ; then
		    C4_I_GN_SKIPPED[$gn]=1;
		    break
		fi
	    done
	fi
    fi
    test 0 -ne "${C4_I_GN_SKIPPED[$gn]}"
}

##  check validity/availability of a node
function c4.i.gn_for {
    for gn in $(seq $( c4.i.gn_min ) $( c4.i.gn_max )) ; do
	c4.i.gn_skipped $gn ||\
	    printf "%s" $gn | $@ 
    done
    
}
#function c4.i.is_gn {
#seq "$(<.min)" "$(<.max)" | grep -v "$( perl -le 'printf q{\(%s\)}, join q{\|}, map {chomp;$_} <>' <.skip )" | grep "$(hostname -s | tr -d '[[:alpha:]]')" >/dev/null 2>&1 && echo OK
#}


function c4.fa_src {
    local src #="$(case $# in 1) $1 ;; *) $( c4.i.of $@ ) ;; esac)"; shift;
    case $# in
	1) src=$1 ;;
	*) src=$( c4.i.of $@ ) ;;
    esac
    test -n "$src" && printf "%s" "$src"
}

##  return first identifier from source
##  where SOURCE is a readable file
function c4.i.val {
    local src=$( c4.fa_src $@ )
    if test -z "$src" -o ! -r "$src" ; then
	# || test 0 == "$(file "$src" | grep text >2 2>&1; echo $?)"
	echo "WARN" "C4R${C4_RUN}${C4_TR}_VAL: BAD SRC ($src)" >&2 # LOG
	return 1;
    fi
    head -1 $src
}

##  return source identifiers
##  where SOURCE is a readable file
function c4.i.vals {
    local src=$( c4.fa_src $@ )
    if test -z "$src" -o ! -r "$src" ; then
	echo "WARN" "C4R${C4_RUN}${C4_TR}_VAL: BAD SRC ($src)" >&2 # LOG
	return 1;
    fi
    cat $src
}

##  call COMMAND for each identifier from SOURCE
##  where SOURCE is a readable file
function c4.i.for {
    local src=$( c4.fa_src $1 )
    if test -z "$src" -o ! -r "$src" ; then
	echo "WARN" "C4R${C4_RUN}${C4_TR}_FOR: missing SRC" >&2 # LOG
	return 1;
    fi

    local line=; while read line ; do
	$@ "'""$line""'"
    done <$src
}

function c4.i.autosave {
    test -z "$C4_I_INHIBIT_AUTOSAVE" \
	|| return;

    local src=$( c4.fa_src $1 ); shift
    if test -z "$src" -o  ! -r "$src" ; then
	echo "WARN" "C4R${C4_RUN}${C4_TR}_AUTOSAVE: missing SRC" >&2 # LOG
	return 1;
    fi

    cp $src $src~
}

function c4.i.touch {
   local src=$( c4.fa_src $1 ); shift
   test -z "$src" -o -n "$src" && touch $src
}

function c4.i.clear {
    local src=$( c4.fa_src $1 ); shift
    if test -z "$src" -o ! -r "$src" ; then
	echo "WARN" "C4R${C4_RUN}${C4_TR}_CLEAR: missing SRC" >&2 # LOG
	return 1;
    fi
    c4.i.autosave $src
    printf ''>$src
}

function c4.i.set {
    local src=$( c4.fa_src $1 ); shift
    local d=
    if test -r "$src" ; then
	# identity dotfile exists
	c4.i.clear $src # this handles autosave (when not inhibitied)
    elif test -n "$src" \
	 && $( d=$(dirname $src);
	       test -d "$d" -a -r "$d" ); then
	# doesn't exist but path is a writable directory
	c4.i.init $src
    else
	echo "WARN" "C4R${C4_RUN}${C4_TR}_SET: missing SRC" >&2 # LOG
	return 1;
    fi

    local v;
    for v in "$@" ; do
	printf '%s'"\n" "$v" >>$src
    done
}

# Lab: breaking underbar sepeared words into wordlists
# declare -p |  perl -pe 's/declare -\S+ ([^\s=]+).*$/$1/; s/^(\s|_)+//;' | grep -i ^_\\?c4 | cut --output-delimiter=' ' -d '_' -sf 1,2,3,4,5,6,7,8,9,10

##  return identity source of [[ <context1> [...]] query
##  where QUERY (and CONTEXT1, etc, if provided) are words
C4_I_ID=.
function c4.i.of {
    local context="$C4_IS";
    local query=$1; shift;
    while test -n "$1" ; do
	# query cannot be empty or contain / or .
	# starting context must exist
	if test -z "$query" -o ! -d "$context" \
		|| [[ "$query" =~ "/" ]] \
		|| [[ "$query" =~ '.' ]]; then
	    echo "WARN" "C4R${C4_RUN}I_OF: bad QUERY \"$query\" (for context \"$context\")" >&2 # LOG
	    return 1;
	fi
	# subsume query  into context
	context="$context/$query"
	# pop query from input stack
	query=$1 ; shift
    done

    # context mus be an existant path and query must be a word not
    # containing slash or dot
    if test -z "$query" -o ! -d "$context" \
	    || [[ "$query" =~ "/" ]] \
	    || [[ "$query" =~ '.' ]]; then
	echo "WARN" "C4R${C4_RUN}I_OF: bad QUERY \"$query\" (for context \"$context\")" >&2 # LOG
	return 1;
    elif ! [[ "$context" =~ ^$C4_ROOT ]]; then
	
	echo "WARN" "C4R${C4_RUN}I_OF: context \"$context\" outside C4:$C4_ROOT for QUERY \"$query\")" >&2 # LOG
    fi

    # return valid seeming identity file
    printf '%s/%s%s' "$context" "$C4_I_ID" "$query"
}

#  return true when given an existant identity
function c4.i.has {
    local src="$(c4.i.of "$@" )";
    test -n "$src" -a -r "$src"
}
# TODO make real tests out of these
#(C4_IS=""; c4.i.has ".") && echo ok || echo nope
#c4.i.has "gn" "max" && echo ok || echo nope
#c4.i.has "users" && echo ok || echo nope

C4_TR='H';   ###  HEAPS

##  fill given array var with lines from STDIN
declare    C4_H_FOR_HI=/dev/stdin
#declare -p C4_H_FOR_AO >/dev/null 2>&1 && unset C4_H_FOR_AO;
declare -a C4_H_FOR_AO=()
declare -i C4_H_FOR_CI=-1
declare -i C4_H_FOR_CO=-1
function c4.h.array {
    local line=
    local IFS=

    C4_H_FOR_AO=()
    C4_H_FOR_CI=-1
    C4_H_FOR_CO=-1

    if test -p $C4_H_FOR_HI ; then
	while read line ; do
	    C4_H_FOR_CI=$((C4_H_FOR_CI+1))
	    test -n "$line" || continue
	    C4_H_FOR_CO=$((C4_H_FOR_CO+1))
	    C4_H_FOR_AO+=("$line")
	    echo "GOT: ${C4_H_FOR_AO[$C4_H_FOR_CO]}"
	done <$C4_H_FOR_HI
    fi
}

C4_TR='S';   ###  SPOKES

C4_S_IS_SI=spoke
##  return true when given an existant spoke
function c4.s.is {
    local C4_ROOT=$C4_SPOKES;
    local C4_IS=$C4_SPOKES;

    c4.i.of $@ $C4_S_IS_SI # 2>/dev/null
}

C4_S_READY_Q=
C4_S_READY_OK=OK
C4_S_READY_NOTOK=
function c4.s.ready {
    local quiet=$C4_S_READY_Q;
    case $1 in
	-q) quiet=1; shift ;;
    esac
       
    local f=$( c4.s.is $@ );

    test -n "$f" -a -r "$f"
    local rv=$?

    if test -z "$quiet" ; then
	if test 0 -eq "$rv" ; then
	    echo $C4_S_READY_OK
	else
	    echo $C4_S_READY_NOTOK
	fi
    fi
    
    return $rv
}

C4_S_IS=spokes
function c4.s.spokes {
    local C4_IS=$C4_SS;
    local C4_I_ID=

    local src=$( c4.i.of $C4_S_IS $@ )
    if test -n "$src" -a -r "$src" ; then
	c4.i.vals $src;
    fi
}

function c4.i.spokes {
    c4.i.vals $( c4.i.of $C4_S_IS )
}

C4_S_SSHFS_CMD="echo sshfs"
C4_S_SSHFS_OPT="-o allow_other"
function c4.s.sshfs {
    if test -z "$1"; then
	echo "WARN" "C4R${C4_RUN}S_SSHFS: missing FROM" >&2 # LOG
	return 1;
    fi
    if test -z "$2"; then
	echo "WARN" "C4R${C4_RUN}S_SSHFS: missing TO (FROM \"$1\")" >&2 # LOG
	return 2;
    fi
    if test ! -d "$2"; then
	echo "WARN" "C4R${C4_RUN}S_SSHFS: missing or non-directory TO \"$2\" (FROM \"$1\")" >&2 # LOG
	return 3;
    fi
    $C4_S_SSHFS_CMD $C4_S_SSHFS_OPT $@
}

## run mkdir locally if the given spoke is up, otherwise use SSH
_c4_mkdir_debug="$(c4.s.first "$_C4_MKDIR_DEBUG" "$C4_DEBUG")"
function c4.mkdir {
    _c4_mkdir_islocal="$(
      c4.s.host "$(
        c4.s.firstmatch ! - "$@"
      )"
     )"
    if test -n "$_c4_mkdir_islocal" ; then
	if test -z "$_c4_mkdir_debug" ; then
	    mkdir $@
	else
	    echo mkdir $@
	fi
    else
	c4.ssh mkdir $@
    fi
}

##  Create a shell script by reading STDIN
_c4_mksh_infh=/dev/stdin    # read from STDIN by default
_c4_mksh_otfh=/dev/stdout   # write to STDOUT by default
_c4_mksh_bash=/usr/bin/bash # script for bash by default
function c4.mksh {
    local C4_MKSH_INFH="$(c4.s.first      "$C4_MKSH_INFH" "$_c4_mksh_infh" /dev/stdin)"
    local C4_MKSH_OTFH="$(c4.s.first "$1" "$C4_MKSH_OTFH" "$_c4_mksh_otfh" /dev/stdout)"
    local C4_MKSH_BASH="$(c4.s.first "$2" "$C4_MKSH_BASH" "$_c4_mksh_bash" /usr/bin/bash)"

    printf '#!%s'"\n" "$C4_MKSH_BASH" >$C4_MKSH_OTFH

    while IFS= read -r line; do
	echo "$line" >> $C4_MKSH_OTFH
    done <$C4_MKSH_INFH

    # set the executable bit when making a regular file
    test -f $C4_MKSH_OTFH && chmod a+x $C4_MKSH_OTFH
}

# run command on rhost via ssh when not on rhost
_c4_ssh_debug="$(c4.s.first "$_C4_SSH_DEBUG" "$C4_DEBUG")"
_C4_SSH="${_C4_SSH:-ssh}"
function c4.ssh {
    local host="$1"; shift;
    if c4.gw_is_localhost "$host" ; then # run locally
	if test -z "$_c4_ssh_debug" ; then
	    $@
	else
	    echo "$@"
	fi		
    else # use ssh
	local sshcmd="$( printf '%s %s' \
	      		 	"$(c4.s.first $C4_SSH $_C4_SSH "ssh")" \
	      		 	"$(c4.fqn "$host" )" \
				)";
	if test -z "$_c4_ssh_debug" ; then
	    $sshcmd $@
	else
	    echo "$sshcmd $@"
	fi	
    fi
}

##  
_c4_rsync_debug="$(c4.s.first "$_C4_RSYNC_DEBUG" "$C4_DEBUG")"
function c4.rsync {
    local m="$( c4.s.firstmatch ":" "$@" )";
    if test -n "$m" ; then
	m="$(echo "$m" | cut -d ':' -f 1)"
    else
	m="$(c4.s.host "$( c4.s.firstmatch ! ^ - "$@" )")"
    fi
    if test -n "$m" && c4.gw_is_localhost "$m"; then
	if test -z "$_c4_rsync_debug" ; then
	    echo TROUBLE mkdir $@
	else
	    echo mkdir $@
	fi
    else
	c4.ssh mkdir $@
    fi
}


# run command on rhost via ssh when not on rhost
_c4_cmd_debug="$(c4.s.first "$_C4_CMD_DEBUG" "$C4_DEBUG")"
# function c4.cmd {
    # _c4_mkdir_islocal="$(
    #   c4.s.host "$(
    #     c4.s.firstmatch ! - "$@"
    #   )"
    #  )"
#     if test -n "$_c4_mkdir_islocal" ; then
#     if test -z "$_c4_rsync_debug" ; then
# 	$_c4__cmdpre $@
#     else
# 	echo $_c4__cmdpre $@
#     fi
#}

# run rsync on rhost via ssh when not on rhost
# function c4.rsync {
#     if test -z "$_c4_rsync_debug" ; then
# 	$_c4_rsync_ssh $@
#     else
# 	echo $_c4_rsync_ssh $@
#     fi
# }

C4_TR=w  # wheels-up!

##  brute force all the things
function c4.SPOKES_UP {
    local s;
    local i;
    local rv=0;
    for i in $( c4.i.spokes ) ; do
	for s in $( c4.s.spokes $i ); do
	    c4.s.ready -q $s $i || c4.s.sshfs $s:/$i $C4_SPOKES/$s/$i;
	    rv=$((rv+$?))
	done ;
    done
    return $rv
}

# done! define a version function to confirm we exist!
function c4.VERSION {
    printf '%s %s %s' C4 GHOSTWHEEL 1.0.50
}

####
#### END
####
