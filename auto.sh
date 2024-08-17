#!/bin/bash

# File to check  
FILE="n0kovo_subdomains_huge.txt"

# Check if the file exists  
if [ -e "$FILE" ]; then  
    echo "The file '$FILE' exists."

else  
    echo "The file '$FILE' does not exist."
    wget "https://raw.githubusercontent.com/n0kovo/n0kovo_subdomains/main/n0kovo_subdomains_huge.txt"
fi
cat "n0kovo_subdomains_huge.txt" | wc -l


if [ $# -eq 0 ]; then  
    echo "No arguments provided. Please provide at least one argument."
else  
    echo "Arguments provided:"
    for arg in "$@"; do  
        echo "- $arg"
    done  
fi

TARGET_ARG=""

# Loop through the command-line arguments  
while [[ $# -gt 0 ]]; do  
    case $1 in  
        -u)
            TARGET_ARG="$2"  # Capture the next argument  
            shift 2        # Move past the -u and its argument  
            ;;
        *)
            shift          # Move to the next argument  
            ;;
    esac  
done

# Check if TARGET_ARG was set  
if [[ -n "$TARGET_ARG" ]]; then  
    echo "Argument after -u: '$TARGET_ARG'"
else  
    echo "No argument provided after -u."
fi


TARGET_ARG="rewire.com"
mkdir $TARGET_ARG
cd $TARGET_ARG"/"
subfinder -d $TARGET_ARG -all | anew subs.txt

# shuffledns -d $TARGET_ARG  -r resolvers.txt -w nokovo_subdomains_huge.txt | anew subs.txt

# dnsx -1 subs.txt -r resolvers.txt | anew resolved.txt

# naabu -1 resolved.txt -nmap -rate 5000 | anew ports.txt; httpx -l ports .txt | anew alive.txt 
katana -list subs.txt -kf all -jc | anew urls.txt 
nuclei -l urls.txt -es info, unknown -ept ssl -ss template-spray | anew nuclei.txt
