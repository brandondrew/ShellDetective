#!/usr/bin/env ksh

### guarantee operations happen in proper directory ###
cd "$( dirname "$_" )" > /dev/null
# ksh has no pushd... :p

### load our testing functions ###
source "./test_helper"

########################################################################
### test parent pid ###
  description="Crystal will reliably get the process ID of the shell"
 crystal_ppid=$(./ppid)
     shell_id=$(echo $$)

assert_equal "$crystal_ppid" "$shell_id" "$description"


########################################################################
### test shell_name ###
description="Crystal will correctly get the name of this file"
   expected="test.ksh"
     actual=$(../shell_name)

assert_equal "$expected" "$actual" "$description"



# ksh has no popd either,
# but cd seems to not persist beyond the script's run