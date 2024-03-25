pipeline {
    agent {
        node {
            label 'docker-agent-alpine'
        }
    }
    triggers {
        pollSCM '*/5 * * * *'
    }
    stages {
        stage('Build') {
            steps{
                echo "====Checking For Changes===="
                sh 'pwd'
                sh 'test.sh'
            }
        }

        stage('Deliver') {
            steps {
                echo "====Pushing changelog to Github REPO===="
            }
        }
    }
}