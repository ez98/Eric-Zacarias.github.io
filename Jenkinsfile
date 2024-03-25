pipeline {
    agent {
        node {
            label 'docker-agent-alpine'
        }
    }
    triggers {
        pollSCM '/5 * * * *'
    }
    stages {
        stage('Build') {
            steps{
                echo "====Checking For Changes===="
            }
        }

        stage('Deliver') {
            steps {
                echo "====Pushing changelog to Github REPO===="
            }
        }
    }
}