#!/usr/bin/env bash
#
# git-restore-with-extension-ui.sh restore files from stage area by extension file

extension=${1:?"Error: First parameter should be an extension file."}

readonly TITLE_MSG="Tracked files to unstaged with extension (${extension}):"
readonly ERROR_MSG="Tracked files with extension: ${extension} don't exist"
readonly ERROR_REPO="Current directory is not a git repository"
readonly WARN_MSG="You did not select any file to restore with ${extension} extension"
readonly SUCCESS_MSG="🟢 Selected files were unstaged"

#######################################
# A function to print out error messages 
# Globals:
#   
# Arguments:
#   None
#######################################
error() {
  echo "[🔴 $(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

#######################################
# A function to print out warning messages 
# Globals:
#   
# Arguments:
#   None
#######################################
warning() {
  echo "[🟡 $(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

git rev-parse --is-inside-work-tree || { error ${ERROR_REPO}; return 1; }

staged_files=$(git --no-pager diff --name-only --cached --diff-filter=AM \
  | grep ".*.${extension}$")

if [[ ${staged_files} ]]; then
  let counter=0
  line=$(echo "${staged_files}" | grep ".*.${extension}$" \
    | while read staged_file; do
    let "counter+=1"
    echo "\"${staged_file}\" \"${counter}\" off"
    done)
  echo ${line};
  selected_files=$(echo ${line} |
    xargs dialog --stdout --checklist ${TITLE_MSG} 0 0 0)
  [[ "${selected_files}" != "" ]] \
    && echo "${selected_files}" | xargs git restore --staged \
    && echo "${SUCCESS_MSG}" \
    || warning ${WARN_MSG}
else
    error ${ERROR_MSG}
    return 1
fi
