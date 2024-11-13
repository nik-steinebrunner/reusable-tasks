#!/bin/sh

set -e

install_task() {
    sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d
}

download_taskfile() {
    curl --silent -o Taskfile.yaml https://raw.githubusercontent.com/nik-steinebrunner/reusable-tasks/main/Taskfile.yaml
}

run_task_init() {
    task main:init
}

main() {
    if [ "$1" = "--install-task" ] || [ "$1" = "-i" ]; then
      install_task
    fi

    download_taskfile
    run_task_init
}

main "$@"