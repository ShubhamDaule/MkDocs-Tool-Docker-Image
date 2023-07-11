FROM python

# Install Mkdocs
RUN pip install mkdocs

# Set the working directory
WORKDIR /app

# Copy the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh

# Set the entrypoint command
ENTRYPOINT ["/app/entrypoint.sh"]