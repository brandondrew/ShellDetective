# Assumptions
#------------
# the shell must have the ps utility available
# and must respond to something of the form
#     ps h -p 12345 -o args=''
# if I discover shells that can't do that,
# I'll amend this to handle them.


# NOTICE!
# when compiled, Process.ppid seems to give the correct process ID
# when run in the "interpreted" fashion, it is unreliable.

class ShellDetector

  def name_from_process
    # we get the shell process ID from outside of the shell
    # to avoid shell differences in reporting IDs
    # and we get the parent of THIS process, rather than
    # the id of the shell process that we spawn
    # to avoid the possibility of them being different
    parent_id = Process.ppid
    # h may not be necessary...
    # if -o args='' fails we can extract the useful bits ourselves
    raw_name = `ps h -p #{parent_id} -o args=''`

    case raw_name
    when "-sh"
      "csh"
    when "-csh"
      "tcsh"
    else
      raw_name.split("/").last
    end
  end

end

shell = ShellDetector.new
puts shell.name_from_process

#### this is currently very simple but could have a lot of things
#### added, perhaps taking on an interface like so, for getting

### a) general info about the shell:

# $ shell --name
# zsh

# $ shell --id
# 12345

# $ shell --level
# 1

### b) "localized" code to do something particular in the shell:

# $ shell --random-integer
# $RANDOM

# $ shell --argument=1
# $1
# $ shell --argument=2
# $2

# $ shell --has-backtick-expansion
# false     # for fish

# $ shell --command-expansion --contents=ls
# $( ls )             # zsh, bash, ksh
# ( ls )              # fish
# ` ls `              # tcsh


# all this could aid in writing super-portable shell scripts...



# These examples are shown in an interactive shell, but the goal would
# be to make these useful from within scripts and sourced functions,
# allowing code that could be more easily used from multiple shells.