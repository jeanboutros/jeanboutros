#!/usr/bin/env zsh

# Check that --short option is provided optionally
short=""
if [ -n "$1" ]  && [ "$1" = "--short" ]; then
    short="-short"
fi

INPUT_FILE="README$short.md"
# This script converts the README.md to PDF and saves it as $(date +%Y%m%d)-Jean-Boutros-CV-DE$short.pdf
OUTPUT_FILE="$(date +%Y%m%d)-Jean-Boutros-CV-DE$short.pdf"
echo "Converting $INPUT_FILE to $OUTPUT_FILE ..."

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null
then
    echo "pandoc could not be found, will install it now."
    brew update
    brew install pandoc weasyprint 
fi

# Convert using pandoc with custom styling
pandoc "$INPUT_FILE" -t pdf -o "$OUTPUT_FILE" --pdf-engine=weasyprint --css=cv-style.css