#!/usr/bin/env bash
# shellcheck disable=SC2034
script_name=$(basename "$0")
script_dir="$( cd "$(dirname "$0")" || exit ; pwd -P )"

set -e -o pipefail

usage() {
    printf "usage: %s [OPTS]\\n" "${script_name}"
    printf "OPTS:\\n"
    printf "    -h | --help                     Display this message\\n"
    exit 0
}

while [[ $# -gt 0 ]]; do
    case "${1}" in
        -h*|--help*|*) usage ;;
    esac
    shift
done

if [ -f "/.dockerenv" ]; then
    printf "Already running in a container.\\n"
    exit 0
fi

# Start the container in the background
docker run -itd --rm \
    --privileged \
    -v ${script_dir}/..:/home/build/regolith \
    -v /opt/yocto:/opt/yocto \
    --name regolith \
    -w /home/build/regolith \
    regolith-build

docker exec -it regolith bash