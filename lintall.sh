#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function lintall () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m "$BASH_SOURCE"/..)"
  local LINT_CLI="$(nodejs "$SELFPATH"/find_yamllint_cli.js)"
  [ -x "$LINT_CLI" ] || return 8$(echo "E: cannot find the yamllint CLI" >&2)
  local FIND_OPTS=(
    -mount
    -name '*.yaml'
    )
  local FIND_PATHS=()
  local ITEM=
  for ITEM in "$@"; do
    case "$ITEM" in
      . | ./* | /* ) FIND_PATHS+=( "$ITEM" );;
      * ) FIND_OPTS+=( "$ITEM" );;
    esac
  done
  exec 7< <(find "${FIND_PATHS[@]}" "${FIND_OPTS[@]}" | sort --version-sort)
  local ERR_CNT=0 LINT_MSG= LINT_RV=
  while read -r -u 7 ITEM; do
    ITEM="${ITEM#./}"
    echo -n "$ITEM: "
    LINT_MSG="$(nodejs -- "$LINT_CLI" /dev/stdin <"$ITEM" 2>&1)"
    LINT_RV=$?
    <<<"$LINT_MSG" "$SELFPATH"/tidy_output.sed
    [ "$LINT_RV" == 0 ] || (( ERR_CNT += 1 ))
  done
  [ -n "$LINT_RV" ] || return 3$(echo "E: no yaml files have been found!" >&2)
  return "$ERR_CNT"
}


lintall "$@"; exit $?
