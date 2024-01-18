pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    docker.build("nginx:latest")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    def testResult = sh(script: 'npm test', returnStatus: true)
                    
                    if (testResult == 0) {
                        echo 'Tests passed. Building Docker image.'
                        docker.image("nginx:latest").inside {
                            // Add additional build steps if needed
                        }
                    } else {
                        currentBuild.result = 'FAILURE'
                        echo 'Tests failed. Sending notification to developer.'
                        // Add logic to send notification to developer (email, Slack, etc.)
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Push the Docker image to a registry
                    docker.withRegistry('https://hub.docker.com/_/nginx',) {
                        docker.image("nginx:latest").push()
                    }
                }
            }
        }
    }
}
