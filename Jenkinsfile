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
                sh 'cd /home/jenkins/workspace/github-test'
                // sh 'chmod +x /home/jenkins/workspace/github-test/test.sh'
                sh '/home/jenkins/workspace/github-test/test.sh'
            }
        }

        stage('Deliver') {
            steps {
                echo "====Pushing changelog to Github REPO===="
            }
        }
    }
}