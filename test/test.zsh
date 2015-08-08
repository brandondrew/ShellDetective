#!/usr/bin/env zsh

### guarantee operations happen in proper directory ###
cd "$( dirname "${(%):-%x}" )" > /dev/null


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
   expected="test.zsh"
     actual=$(../shell_name)

assert_equal "$expected" "$actual" "$description"

