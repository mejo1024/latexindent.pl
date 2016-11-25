#!/bin/bash

# A little script to help me run through test cases

#echo latexindent.pl -w -t -l=table5.yaml -s table5
#latexindent.pl -w -t -l=table5.yaml -s table5

silentMode=0
silentModeFlag=''
showCounterFlag=''
# check flags, and change defaults appropriately
while getopts "sc" OPTION
do
 case $OPTION in 
  s)    
   echo "Silent mode on..."
   silentModeFlag='-s'
   silentMode=1
   ;;
  c)    
   echo "Show counter mode active!"
   showCounterFlag='-c'
   ;;
  ?)    printf "Usage: %s: [-s]  args\n" $(basename $0) >&2
        exit 2
        ;;
 # end case
 esac 
done

# set verbose mode, 
# see http://stackoverflow.com/questions/2853803/in-a-shell-script-echo-shell-commands-as-they-are-executed

# environment objects
cd environments
[[ $silentMode == 1 ]] && echo "./environments/environments-test-cases.sh"
./environments-test-cases.sh $silentModeFlag $showCounterFlag
# ifelsefi objects
cd ../ifelsefi
[[ $silentMode == 1 ]] && echo "./ifelsefi/ifelsefi-test-cases.sh"
./ifelsefi-test-cases.sh $silentModeFlag $showCounterFlag
# optional arguments in environments
cd ../opt-args
[[ $silentMode == 1 ]] && echo "./opt-args/opt-args-test-cases.sh"
./opt-args-test-cases.sh $silentModeFlag $showCounterFlag
# mandatory arguments in environments
cd ../mand-args
[[ $silentMode == 1 ]] && echo "./mand-args/mand-args-test-cases.sh"
./mand-args-test-cases.sh $silentModeFlag $showCounterFlag
# mixture of optional and mandatory arguments
cd ../opt-and-mand-args/
[[ $silentMode == 1 ]] && echo "./opt-and-mand-args/opt-and-mand-args-test-cases.sh"
./opt-mand-args-test-cases.sh $silentModeFlag $showCounterFlag
# items
cd ../items/
[[ $silentMode == 1 ]] && echo "./items/items-test-cases.sh"
./items-test-cases.sh $silentModeFlag $showCounterFlag
# commands
cd ../commands/
[[ $silentMode == 1 ]] && echo "./commands/commands-test-cases.sh"
./commands-test-cases.sh $silentModeFlag $showCounterFlag
# key equals value braces
cd ../keyEqualsValueBraces/
[[ $silentMode == 1 ]] && echo "./keyEqualsValueBraces/key-equals-values-test-cases.sh"
./key-equals-values-test-cases.sh $silentModeFlag $showCounterFlag
exit
