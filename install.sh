#!/usr/bin/env bash
#
# install.sh installs things.

SCRIPT_NAME=${1:-"install.sh"}

# Send all our -x output to this file for later debugging
LOG_DIR="$HOME/install.sh.logs"
mkdir -p "${LOG_DIR}"
exec 1>"${LOG_DIR}/stdout"
exec 2>"${LOG_DIR}/stderr"
exec 19>"${LOG_DIR}/trace"
BASH_XTRACEFD=19

set -x

echo "${SCRIPT_NAME} start: $(date)"

DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

# find the installers and run them iteratively
echo "👟 Running installers 👟"
for installer in $(find . -name "*install-tool.sh"); do
  sh -c "${installer}"
done

echo ''
echo '🏁 All installed! 🏁'
