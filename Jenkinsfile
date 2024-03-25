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
                sh """
                    cd /home/jenkins/workspace/github-test
                    chmod +x /home/jenkins/workspace/github-test/test.sh
                    /home/jenkins/workspace/github-test/test.sh
                """
                withCredentials([string(credentialsId: 'API_TOKEN', variable: 'TOKEN')]) 
                {
                    sh '''
                        echo "My secret: ${TOKEN}"
                    '''
                }
        }

        stage('Deliver') {
            steps {
                echo "====Pushing changelog to Github REPO===="
            }
        }
    }
}