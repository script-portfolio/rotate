#!/bin/bash


function rotate () {
    local FILE="$1"
    local MAX=${2:-90}

    local BODY="$(basename $FILE)"
    local DATA_DIR="$(dirname $FILE)"

    local ROTATE_FLAG=
    [ -e "${FILE}" ] && ROTATE_FLAG=1

    [ -n "${ROTATE_FLAG}" ] && {
      find "${DATA_DIR}" -maxdepth 1 -name ${BODY}\.\* \( -type d -or -type f \) -printf '%f\n' | sort -t '.' -k1 -nr | while read CF; do
        NUM=${CF##*\.}
        #NUM=$(echo ${NUM}|sed -e 's/^0*//g')
        #echo "Found: $CF NUM: $NUM" >&2
        printf -v NEWCF "${BODY}.%d" $((++NUM))
        if ((NUM<=MAX)); then
            [ -d "${DATA_DIR}/${NEWCF}" ] && {
                rm -rf "${DATA_DIR}/${NEWCF}"
            }
          mv "${DATA_DIR}/$CF" "${DATA_DIR}/${NEWCF}"
        else
          [ -e "${DATA_DIR}/$NEWCF" ] && rm -rf "${DATA_DIR}/${NEWCF}"
        fi
      done
      mv "${DATA_DIR}/$BODY"  "${DATA_DIR}/${BODY}.0"
    }
}


[ -z "${1:-}" ]  && {
	echo 'Need to specify file/directory'
	exit 1
}

rotate "$1"
