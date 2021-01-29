#!/bin/sh

set -e
set -x

BASE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd )"

ln -sf ${BASE_PATH}/my.cnf ${HOME}/.my.cnf
