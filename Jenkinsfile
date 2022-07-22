
pipeline {

    environment {
        dockerImage = "group-work" // docker image name
        pullFrom = "ghpotter"
    }


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
                //sh 'python microhttp'

                // requires connecting kubectl to the cluster

                sh 'sudo docker image pull ${pullFrom}/${dockerImage}'

                sh 'kubectl create namespace appspace'

                sh 'kubectl run py-app --image=${dockerImage} --port=8080 -n appspace'


                // Create a service
                // Make the service visible
                sh 'kubectl port-forward service/${dockerImage} 8080:8080'

            }
        }
    }
}
