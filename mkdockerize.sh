#!/bin/bash

# Check if the script is executed with the correct number of arguments
if [ $# -ne 1 ]; then
  echo "Usage: ./mkdockerize.sh [path_to_mkdocs_project]"
  exit 1
fi

# Store the argument (path to Mkdocs project directory) in a variable
mkdocs_project_path=$1

# Build the Docker image
docker build -t mkdocs_image .

# Run the Docker image with the "produce" command
docker run -v "$mkdocs_project_path:/app" mkdocs_image produce > website.tar.gz

# Run the Docker image with the "serve" command
docker run -p 8000:8000 -v "$PWD/website.tar.gz:/app/website.tar.gz" mkdocs_image serve
