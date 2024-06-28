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
        stage('Git') {
            steps {
                echo "====Setting Up Git===="
                withCredentials([usernamePassword(credentialsId: 'GITHUB_PAT', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) 
                {
                    sh '''
                        git config --global user.name "${GIT_USERNAME}"
                        git config --global user.email "ericzacarias80@gmail.com"
                        git remote set-url origin https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/Eric-Zacarias.github.io.git
                        git checkout -b main
                    '''
                }
            }
        }
        stage('Build') {
            steps{
                echo "====Running Changelog Automation Script===="   
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