pipeline {
    agent {
        node {
            label 'docker-agent-alpine-jq'
        }
    }
    triggers {
        pollSCM 'H/5 * * * *'
    }
    stages {
        stage('Clone repository') {
            steps {
                checkout([$class: 'GitSCM', 
                         branches: [[name: '*/main']], 
                         userRemoteConfigs: [[url: 'git@github.com:ez98/Eric-Zacarias.github.io.git']]])
                sh """
                ls
                pwd
                """
            }
        }

        stage('Build') {
            steps{
                echo "====Checking For Changes===="

                withCredentials([string(credentialsId: 'API_TOKEN', variable: 'TOKEN')])
                {
                    sh '''
                        chmod +x /home/jenkins/workspace/github-test/test.sh
                        /home/jenkins/workspace/github-test/test.sh $TOKEN
                    '''
                }
            }
        }

        stage('Deliver') {
            steps {
                echo "====Pushing changelog to Github REPO===="
            }
        }
    }
}