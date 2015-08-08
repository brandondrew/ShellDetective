#!/usr/bin/env tcsh

### guarantee operations happen in proper directory ###
cd `dirname $0` > /dev/null


# we're keepin' it simple for Tenex C shell!
# tcsh has NO FUNCTIONS!  So there'll be NO test_helper!
echo  "##########################################################"
echo  "Manual testing demonstrates that this works in tcsh, but"
echo  "it seems that it cannot be tested with a script in tcsh."
echo  "Using backticks (the only command substitution available)"
echo  "introduces a new PID, thus defeating the test's purpose."
echo
echo  "If the two numbers you see are the same, then Crystal was"
echo  "successful in getting the correct process ID:"
echo    "      Expected: $$"
echo -n "      Actual:   "
./ppid
echo
echo  "If the two values you see are the same, then Crystal was"
echo  "successful in getting the process (e.g. shell) name:"
echo    "      Expected: test.tcsh"
echo -n "      Actual:   "
../shell_name
echo  "##########################################################"
