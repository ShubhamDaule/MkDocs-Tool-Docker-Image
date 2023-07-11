# MkDocs Tool Docker Image

A Docker Image to encapsulate [MkDocs](http://www.mkdocs.org/) tool without you having to install mkDocs locally.

## Requirements

* Docker: Install docker and have it running in your working environment


## Building the Docker Image

* Clone this repository to your local machine.
*  Navigate to the cloned repository directory.
* Build the Docker image using the command: 
```bash 
docker build -t <your-docker-image-name> .
```
* Replace `<your-docker-image-name>` with the desired name for your Docker image.


## Producing the Website

* Ensure you have a valid MkDocs project directory ready.
* Open a terminal or shell environment and navigate to the cloned repository directory.
* Edit the `entrypoint.sh` script and replace the value of the `PROJECT_NAME` variable with the name of your MkDocs project directory.
* Execute the following command to produce the website:
```
docker run --rm -v <local-project-directory>:/app <your-docker-image-name> produce
```
* Replace `<local-project-directory>` with the path to your local MkDocs project directory.
Replace `<your-docker-image-name>` with the name of your Docker image.
* The command will generate a `.tar.gz` file containing the static website in the root directory of the cloned repository.

## Serving the Website

* Execute the following command to serve the website:

```
docker run -it --rm -v "<local-project-directory>:/app" -p 8000:8000 <your-docker-image-name> serve
```
* Replace `<local-project-directory>` with the path to your local MkDocs project directory.
* Replace `<your-docker-image-name>` with the name of your Docker image.
* The website will be served on [http://localhost:8000](http://localhost:8000). Open your web browser and navigate to the provided URL to view the website.

## Jenkins Integration

The repository includes a `Jenkinsfile` that can be used for building and testing the MkDocs project.
* Create a new Jenkins pipeline job.
* Configure the job to use this repository as the source code repository.
* Run the pipeline to build and test the MkDocs project.