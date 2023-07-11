#!/bin/bash

if [[ "$1" == "produce" ]]; then
  # Produce the website
  #mkdocs new myproject
  cd myproject
  mkdocs build
  tar -czvf ../site.tar.gz .
elif [[ "$1" == "serve" ]]; then
  # Serve the website
  tar -xzvf site.tar.gz --directory /tmp
  cd /tmp
  mkdocs serve -a 0.0.0.0:8000
else
  echo "Incorrect Parameter"
fi