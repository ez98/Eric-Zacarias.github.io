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

                withCredentials([usernamePassword(credentialsId: 'GITHUB_PAT', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) 
                {
                    sh '''
                    git config --global user.name "${GIT_USERNAME}"
                    git config --global user.password "${GIT_PASSWORD}"
                    git push --set-upstream origin Eric-Zacarias.github.io
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