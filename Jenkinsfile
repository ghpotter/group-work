
pipeline {
    agent {
        docker {image 'ghpotter/group-work'}
    }

    stages {
        stage('Build') {
            steps {
                echo 'Build stage'
                echo 'Python does not require this step'
            }
        }
        stage('Test') {
            steps {
                echo 'Test stage'
                echo 'No test files'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                // starting app
                sh 'python microhttp'
            }
        }
    }
}
