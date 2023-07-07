# Use an official Python runtime as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Install Mkdocs and any required dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the entrypoint script into the container
COPY mkdockerize.sh .

# Make the entrypoint script executable
RUN chmod +x mkdockerize.sh

# Expose port 8000 for Mkdocs to serve the website
EXPOSE 8000

# Set the entrypoint command to the wrapper script
ENTRYPOINT ["./mkdockerize.sh"]
