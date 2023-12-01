# [go back to overview](https://github.com/c4arl0s#bash-scripts)

# [git-restore-with-filter-ui](https://github.com/c4arl0s/git-restore-with-filter-ui#go-back-to-overview)

Script to restore files from the stage area by filtering extensions.

# [Dependencies](https://github.com/c4arl0s/git-restore-with-filter-ui#go-back-to-overview)

```console
brew install dialog
```

# [How to use it](https://github.com/c4arl0s/git-restore-with-filter-ui#go-back-to-overview)

You can pass whatever extension in order to filter the group of files you want to restore from the stage area.

```console
./git-restore-with-filter-ui.sh txt
```

```console
./git-restore-with-filter-ui.sh java
```

```console
./git-restore-with-filter-ui.sh sh
```

<img width="595" alt="Screenshot 2023-11-30 at 10 24 52 p m" src="https://github.com/c4arl0s/git-restore-with-extension-ui/assets/24994818/77c12bf8-f605-4efe-a418-1ec867aae42f">

# [Code](https://github.com/c4arl0s/git-restore-with-filter-ui#go-back-to-overview)

```bash
#!/usr/bin/env bash

EXTENSION=${1:?"Error: The first parameter is missign, It should be an extension."}
TRACKED_FILES=$(git --no-pager diff --name-only --cached --diff-filter=AM | grep ".*.${EXTENSION}$")

FILES_WITH_EXTENSION="Tracked files to unstaged with extension ($EXTENSION):"
ERROR_MSG="Tracked files with extension: $EXTENSION don't exist"

if [[ $TRACKED_FILES ]]; then
    let COUNTER=0
    LINE=$(git --no-pager diff --name-only --cached --diff-filter=AM | grep ".*.${EXTENSION}$" |
           while read TRACKED_FILE
           do
               let "COUNTER+=1"
               echo "\"$TRACKED_FILE\" \"$COUNTER\" off"
           done
          )
    echo $LINE;
    SELECTED_STAGED_FILES=$(echo $LINE | 
                             xargs dialog --stdout --checklist $FILES_WITH_FILTER 0 0 0
                            )
    [ ! -z "$SELECTED_STAGED_FILES" ] && echo $SELECTED_STAGED_FILES | xargs git restore --staged || echo "🟡 You did not select any file to restore with"
else
    echo  $ERROR_MSG
fi
```
