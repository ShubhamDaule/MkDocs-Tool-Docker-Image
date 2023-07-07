#!/bin/bash

# Check if the command-line argument is provided
if [ $# -eq 0 ]; then
    echo "Please provide a command: 'produce' or 'serve'"
    exit 1
fi

# Get the command-line argument
command=$1

# Shift the command-line arguments to the left
shift

# Run the Docker container with the appropriate command
case $command in
    produce)
        docker run -v $(pwd):/app <the-docker-image-name> mkdocs build -d /app/site
        tar czf - -C $(pwd)/site .  # Create .tar.gz file and write to stdout
        ;;
    serve)
        docker run -p 8000:8000 -v $(pwd):/app <the-docker-image-name> mkdocs serve --dev-addr=0.0.0.0:8000
        ;;
    *)
        echo "Invalid command: $command"
        exit 1
        ;;
esac
