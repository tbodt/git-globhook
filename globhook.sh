#!/bin/bash
hook="$(basename $0)"
hooks_path=(
    "$(git config --default .git/hooks --local core.hooksPath)"
    "$(git config --default ~/.githooks globhook.dir)"
)
for dir in "${hooks_path[@]}"; do
    if [[ -x "$dir/$hook" ]]; then
        exec "$dir/$hook"
    fi
done
