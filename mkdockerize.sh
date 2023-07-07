#!/bin/bash

if [ "$1" == "produce" ]; then
  # Execute mkdocs to produce the website and write it to a tar.gz file
  mkdocs build --clean
  tar -czvf website.tar.gz site/
  cat website.tar.gz
elif [ "$1" == "serve" ]; then
  # Read the tar.gz file from stdin and extract it
  tar -xzvf - -C /tmp

  # Serve the website using mkdocs
  mkdocs serve -a 0.0.0.0:8000 -f /tmp/site/mkdocs.yml
else
  echo "Invalid command"
fi
