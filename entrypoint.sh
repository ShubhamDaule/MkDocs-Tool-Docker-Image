#!/bin/bash

if [[ "$1" == "produce" ]]; then
  # Produce the website

  # Change to the project directory
  cd myproject

  # Build the Mkdocs site
  mkdocs build

  # Create a tar.gz archive of the generated site
  tar -czvf ../site.tar.gz .

  # Check if the site.tar.gz file was created successfully
  if [[ $? -eq 0 ]]; then
    echo "Website production completed successfully."
  else
    echo "Failed to create the site.tar.gz archive."
    exit 1
  fi

elif [[ "$1" == "serve" ]]; then
  # Serve the website

  # Extract the site.tar.gz file to a temporary directory
  tar -xzvf site.tar.gz --directory /tmp

  # Check if the extraction was successful
  if [[ $? -eq 0 ]]; then
    echo "Website files extracted successfully."
  else
    echo "Failed to extract the site.tar.gz archive."
    exit 1
  fi

  # Change to the temporary directory
  cd /tmp

  # Serve the site using Mkdocs on port 8000
  mkdocs serve -a 0.0.0.0:8000

  # Check if Mkdocs serve command completed successfully
  if [[ $? -ne 0 ]]; then
    echo "Failed to serve the website."
    exit 1
  fi

else
  echo "Incorrect Parameter"
  exit 1
fi
