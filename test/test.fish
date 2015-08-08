#!/usr/bin/env fish

### colors & styling: ###
set red   "\033[31m"
set green "\033[32m"
set clear "\033[0m"

### compile all *.cr files ###
crystal build *.cr  # --release


########################################################################
### test ppid ###
set description "Crystal will reliably get the process ID of the shell"
set crystal_ppid ("./ppid")
set shell_id (echo %self)

if test "$shell_id" = "$crystal_ppid"
  echo -e "$green""PASS: $description$clear"
else
  echo -e "$red""FAIL: $description$clear"
end
echo "      Expected: $crystal_ppid"
echo "      Actual:   $shell_id"

