#!/usr/bin/env csh

### compile all *.cr files ###
crystal build *.cr  # --release

# we're keepin' it simple for C shell!
# csh has NO FUNCTIONS!  So there'll be NO test_helper!
echo  "##########################################################"
echo  "Manual testing demonstrates that this works in csh, but"
echo  "it seems that it cannot be tested with a script in csh."
echo  "Using backticks (the only command substitution available)"
echo  "introduces a new PID, thus defeating the test's purpose."
echo
echo  "If the two numbers you see are the same, then Crystal was"
echo  "successful in getting the correct process ID:"
echo
echo    "      Expected: $$"
echo -n "      Actual:   "
./ppid
echo  "##########################################################"


exit




## what was tried and found wanting:

set description="Crystal will reliably get the process ID of the shell"
set crystal_ppid=`./ppid`
set shell_id=$$ # no $() in tcsh or fish or csh!
# %self for fish!

./ppid

echo $shell_id
echo $crystal_ppid

if ( "$shell_id" == "$crystal_ppid" ) then
  echo "PASS: $description"
else
  echo "FAIL: $description"
endif


