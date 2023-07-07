# Use the official Python base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY . .

# Expose the default Mkdocs serve port
EXPOSE 8000

# Set the default command to run when the container starts
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
