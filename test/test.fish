#!/usr/bin/env fish

### guarantee operations happen in proper directory ###
cd (dirname (status -f)) > /dev/null


### colors & styling: ###
set red   "\033[31m"
set green "\033[32m"
set clear "\033[0m"


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


########################################################################
### test shell_name ###
set description "Crystal will correctly get the name of this file"
set expected "test.fish"
set actual ("../shell_name")

if test "$expected" = "$actual"
  echo -e "$green""PASS: $description$clear"
else
  echo -e "$red""FAIL: $description$clear"
end
echo "      Expected: $expected"
echo "      Actual:   $actual"
