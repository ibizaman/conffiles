#!/bin/bash

read -r -d '' usage <<EOF
usage:
  $0 add DEVICE_WITH_SHARE NEW_DEVICE [all]
  $0 refresh DEVICE_WITH_SHARE
EOF

action="$1"
shift

config_dir="$HOME/.config/syncthingmanager/shares/"
mkdir -p "$config_dir" || exit 1

function config_file() {
    local device="$1"

    echo "$config_dir$device"
}

function refresh() {
    local device="$1"
    local c="$(config_file $device)"

    echo "Refreshing list of directories into $c..."
    l="$(stman --device "$device" folder list)"
    if [ "$l" = "The Syncthing daemon specified is not configured." ]; then
        echo "$l" 1>&2
    else
        echo "$l" > "$c"
    fi
}

function read_config_file() {
    local config_file="$1"
    export "$2"

    a=()
    while IFS= read -r folder; do
        a+=("$folder")
    done < <(awk '/Shared/{next} /^[^ ]/{print ""} {printf "%s ",$NF}' "$config_file" | sort | grep -v "^$")
    eval ${2}='("${a[@]}")'
}

function add() {
    local device_with_share="$1"
    local new_device="$2"
    local show_all=false
    if [ "$3" = "all" ]; then
        show_all=true
    fi
    [ -z "$device_with_share" ] && echo "$usage" && exit 1
    [ -z "$new_device" ] && echo "$usage" && exit 1

    local config_file="$(config_file $device_with_share)"
    local new_device_file="$(config_file $new_device)"
    [ ! -f "$config_file" ] && echo "Please first use $0 refresh $device_with_share" && exit 1
    [ ! -f "$new_device_file" ] && echo "Please first use $0 refresh $new_device" && exit 1

    read_config_file "$config_file" folders
    read_config_file "$new_device_file" new_device_folders

    remaining_folders=()
    for f in "${folders[@]}"; do
        found=false
        if [ "$show_all" = false ]; then
            for n in "${new_device_folders[@]}"; do
                if [[ "$f" =~ $(echo "$n" | cut -f1 -d' ') ]]; then
                    found=true
                    break
                fi
            done
        fi
        if [ "$found" = false ]; then
            remaining_folders+=("$f")
        fi
    done

    while IFS= read -r folder; do
        f=($folder)

        label=${f[0]}
        id=${f[1]}
        path=${f[2]}

        echo "Adding folder $label to $new_device"
        stman --device "$new_device" folder add --label "$label" "$path" "$id"
        stman --device "$new_device" folder share "$label" "$device_with_share"

        echo "Sharing folder $label with $new_device"
        stman --device "$device_with_share" folder share "$label" "$new_device"

    done < <(printf "%s\n" "${remaining_folders[@]}" | fzf --multi --prompt="folder(s) to share > ")
}

if [ "$action" = "refresh" ]; then
    for d in "$@"; do
        refresh "$d"
    done
elif [ "$action" = "add" ]; then
    add "$1" "$2" "$3"
else
    echo "$usage" && exit 1
fi
