pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        // Build the Docker image
        sh 'docker build -t mkdocs_image .'
      }
    }

    stage('Test') {
      steps {
        // Run the produce command for testing
        sh 'docker run -v "$PWD:/app" mkdocs_image produce'
      }
    }
  }
}
