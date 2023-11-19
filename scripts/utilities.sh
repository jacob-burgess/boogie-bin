#!/bin/bash

# Define color/text variables
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
CYAN='\033[1;96m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'
RESET='\033[0m'
BOLD='\033[1m'

# Function to print a message with color
p() {
    local message="$1"
    local color="$2"
    if [ -z "$color" ]; then
        color="$WHITE"
    fi
    echo -en "${color}${message}${RESET}"
}

# Function to print a message with color and a newline
p_ln() {
    p "$@"
    echo ""
}

# Function to print a big boogie
big_boogie() {

  local color="$1"
  if [ -z "$color" ]; then
      color="$PURPLE"
  fi

  center_text "                                                                                                      " "$color";
  center_text "bbbbbbbb                                                                                              " "$color";
  center_text "b::::::b                                                                    iiii                      " "$color";
  center_text "b::::::b                                                                   i::::i                     " "$color";
  center_text "b::::::b                                                                    iiii                      " "$color";
  center_text " b:::::b                                                                                              " "$color";
  center_text " b:::::bbbbbbbbb       ooooooooooo      ooooooooooo      ggggggggg   gggggiiiiiii     eeeeeeeeeeee    " "$color";
  center_text " b::::::::::::::bb   oo:::::::::::oo  oo:::::::::::oo   g:::::::::ggg::::gi:::::i   ee::::::::::::ee  " "$color";
  center_text " b::::::::::::::::b o:::::::::::::::oo:::::::::::::::o g:::::::::::::::::g i::::i  e::::::eeeee:::::ee" "$color";
  center_text " b:::::bbbbb:::::::bo:::::ooooo:::::oo:::::ooooo:::::og::::::ggggg::::::gg i::::i e::::::e     e:::::e" "$color";
  center_text " b:::::b    b::::::bo::::o     o::::oo::::o     o::::og:::::g     g:::::g  i::::i e:::::::eeeee::::::e" "$color";
  center_text " b:::::b     b:::::bo::::o     o::::oo::::o     o::::og:::::g     g:::::g  i::::i e:::::::::::::::::e " "$color";
  center_text " b:::::b     b:::::bo::::o     o::::oo::::o     o::::og:::::g     g:::::g  i::::i e::::::eeeeeeeeeee  " "$color";
  center_text " b:::::b     b:::::bo::::o     o::::oo::::o     o::::og::::::g    g:::::g  i::::i e:::::::e           " "$color";
  center_text " b:::::bbbbbb::::::bo:::::ooooo:::::oo:::::ooooo:::::og:::::::ggggg:::::g i::::::ie::::::::e          " "$color";
  center_text " b::::::::::::::::b o:::::::::::::::oo:::::::::::::::o g::::::::::::::::g i::::::i e::::::::eeeeeeee  " "$color";
  center_text " b:::::::::::::::b   oo:::::::::::oo  oo:::::::::::oo   gg::::::::::::::g i::::::i  ee:::::::::::::e  " "$color";
  center_text " bbbbbbbbbbbbbbbb      ooooooooooo      ooooooooooo       gggggggg::::::g iiiiiiii    eeeeeeeeeeeeee  " "$color";
  center_text "                                                                  g:::::g                             " "$color";
  center_text "                                                      gggggg      g:::::g                             " "$color";
  center_text "                                                      g:::::gg   gg:::::g                             " "$color";
  center_text "                                                       g::::::ggg:::::::g                             " "$color";
  center_text "                                                        gg:::::::::::::g                              " "$color";
  center_text "                                                          ggg::::::ggg                                " "$color";
  center_text "                                                             gggggg                                   " "$color";
  printf "\n"
}

center_text() {
    local text="$1"
    local color="$2"
    local terminal_width=$(tput cols)

    while IFS= read -r line; do
        local padding=$(( (terminal_width - ${#line}) / 2 ))
        echo -e "$(printf "%*s" $padding)${color}${line}${RESET}"
    done <<< "$text"
}

# Function to check if a script is executable
is_executable() {
    local script="$1"
    [ -x "$script" ]
}

# Function to print a number of spaces
pad() {
    local count="$1"
    printf "%-${count}s" ""
}

# Function to check if directories exist
check_directories() {
    for dir in "$@"; do
        if [ ! -d "$dir" ]; then
            print_colored_message "Error: The directory \"$dir\" does not exist." "$RED"
            exit 1
        fi
    done
}

# Function to get the description from a script
get_description() {
    local script_file="$1"
    local description=""

    # Check for Bash-style comments
    local bash_description=$(grep -E "^#\s*Description:\s*" "$script_file" | sed -E 's/^# Description: //')
    if [ -n "$bash_description" ]; then
        description="$bash_description"
    else
        # Check for Node-style comments
        local node_description=$(grep -E "^\/\/\s*Description:\s*" "$script_file" | sed -E 's/^\/\/ Description: //')
        if [ -n "$node_description" ]; then
            description="$node_description"
        fi
    fi

    echo "$description"
}

# Function to run a command script
run_command() {
    local cmd_filename="$1"
    local cmd_dir="$2"
    local cmd_path="$cmd_dir/$cmd_filename"

    if [ -f "$cmd_path" ]; then
        "$cmd_path"
    else
        p_ln "Error: Command '$cmd_filename' not found in '$cmd_dir'." "$RED"
        exit 1
    fi
}
