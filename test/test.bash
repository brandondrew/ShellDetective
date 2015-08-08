#!/usr/bin/env bash

### guarantee operations happen in proper directory ###
cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null


### load our testing functions ###
source "./test_helper"

  description="Crystal will reliably get the process ID of the shell"
 crystal_ppid=$(./ppid)
     shell_id=$(echo $$)

assert_equal "$crystal_ppid" "$shell_id" "$description"

