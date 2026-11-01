# inputloop/pubs: a projection of /h/pub (H:\pub), the publication shelf: papers, posts, persona sheets, the canon and the books

The repository is named `pubs`, the folder `pub`: both spellings are meant (his word, 2026-10-14: "pubs/pub is not a local rename or a typo: I'd like to support this different spelling in that context"). `pubs` names the collection of publications as it travels; `pub` names the shelf where they land.

The reading room where finished writing lands (its own RECIPE.org says how).

This repository is a copy of that folder, refreshed by `sh refresh.sh` (run from here, on the machine that holds
the folder). It carries no history of its own beyond refreshes; the folder is the working copy.
Left out on purpose: `sites/` (13 GB, a site's tree, not a repository's), every `.c4/` (the working sets and provenance rows the shelf keeps but does not let travel), and any item the shelf holds back for now (its hold list is kept in the shelf's own `.c4/`, so held items are not named here). A refresh also removes what the shelf no longer carries. Its promises are checked by `python3 tests/refresh_test.py` (`--prove-red` shows the checks can fail). The shelf's RECIPE.org, section PUBS, says how to rebuild this copy from nothing.

Terms: the collection's TERMS v2 (code GPL-3.0-or-later OR LGPL-3.0-or-later; writing CC-BY-SA-4.0) unless an item
says otherwise; a 0-byte COPYING is a tombstone (only Corwin installs licence text).
