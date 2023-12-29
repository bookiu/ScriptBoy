#!/bin/bash

_logfile=""

_log() {
    local level=$1
    local dt=$(date +'%Y-%m-%d %H:%M:%S')

    if [ -z "$_logfile" ]; then
        echo "[${dt}][${level}] ${@:2}"
    else
        echo "[${dt}][${level}] ${@:2}" | tee -a "$_logfile"
    fi
}

log_file() {
    if [ $# -eq 0 ]; then
        echo "${_logfile}"
        return
    fi
    # set log file path
    _logfile=$1
}

log_debug() {
    _log DEBUG ${@}
}

log_info() {
    _log INFO ${@}
}

log_debug asdf asdf asd fas d
