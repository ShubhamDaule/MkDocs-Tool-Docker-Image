#!/bin/bash

PROJECT_NAME="myproject"
SITE_ARCHIVE="/app/site.tar.gz"
TEMP_DIR="/tmp/mkdocs_site"

produce() {
  # Change to the project directory
  cd "$PROJECT_NAME"

  # Build the Mkdocs site
  mkdocs build

  # Create a tar.gz archive of the generated site
  tar -czvf "$SITE_ARCHIVE" .

  # Check if the site.tar.gz file was created successfully
  if [[ $? -eq 0 ]]; then
    echo "Website production completed successfully."
  else
    echo "Failed to create the $SITE_ARCHIVE archive."
    exit 1
  fi
}

serve() {
  # Extract the site.tar.gz file to a temporary directory
  mkdir -p "$TEMP_DIR"
  tar -xzvf "$SITE_ARCHIVE" --directory "$TEMP_DIR"

  # Check if the extraction was successful
  if [[ $? -eq 0 ]]; then
    echo "Website files extracted successfully."
  else
    echo "Failed to extract the $SITE_ARCHIVE archive."
    exit 1
  fi

  # Change to the temporary directory
  cd "$TEMP_DIR"

  # Serve the site using Mkdocs on port 8000
  mkdocs serve -a 0.0.0.0:8000

  # Check if Mkdocs serve command completed successfully
  if [[ $? -ne 0 ]]; then
    echo "Failed to serve the website."
    exit 1
  fi
}

if [[ "$1" == "produce" ]]; then
  produce
elif [[ "$1" == "serve" ]]; then
  serve
else
  echo "Incorrect Parameter"
  exit 1
fi
