#!/usr/bin/env bash

PARAMETER=$1
TRACKED_FILES=$(git --no-pager diff --name-only --cached --diff-filter=AM | grep $PARAMETER)

FILES_WITH_FILTER="Tracked files to unstaged with filter ($PARAMETER):"
ERROR_MSG="Tracked files with filter: $PARAMETER don't exist"

if [[ $TRACKED_FILES ]]; then
    let COUNTER=0
    LINE=$(git --no-pager diff --name-only --cached --diff-filter=AM | grep $PARAMETER |
           while read TRACKED_FILE
           do
               let "COUNTER+=1"
               echo "\"$TRACKED_FILE\" \"$COUNTER\" off"
           done
          )
    echo $LINE;
    SELECTED_TRACKED_FILES=$(echo $LINE | 
                             xargs dialog --stdout --checklist $FILES_WITH_FILTER 0 0 0
                            )
    echo $SELECTED_TRACKED_FILES | xargs git restore --staged
else
    echo  $ERROR_MSG
fi

