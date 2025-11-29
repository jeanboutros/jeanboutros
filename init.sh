#!/usr/bin/env zsh

# This script converts the README.md to PDF and saves it as $(date +%Y%m%d)-Jean-Boutros-CV-DE.pdf
OUTPUT_FILE="$(date +%Y%m%d)-Jean-Boutros-CV-DE.pdf"
echo "Converting README.md to $OUTPUT_FILE ..."

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null
then
    echo "pandoc could not be found, will install it now."
    brew update
    brew install pandoc weasyprint 
fi

# Convert using pandoc with custom styling
pandoc README.md -t pdf -o "$OUTPUT_FILE" --pdf-engine=weasyprint --css=cv-style.css