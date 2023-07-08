# Use the official Python image as the base image
FROM python:3.11-slim

# Install Mkdocs
RUN pip install mkdocs

# Set the working directory in the container
WORKDIR /app

# Copy the Mkdocs project directory from the host to the container
COPY . /app

# Expose port 8000 for serving the website
EXPOSE 8000

# Default command to execute when the container starts
CMD ["python", "-m", "http.server", "8000"]
