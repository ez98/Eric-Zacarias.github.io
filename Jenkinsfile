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

                withCredentials([usernamePassword(credentialsId: 'GITHUB_PAT', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) 
                {
                    sh '''
                    git config --global user.name "${GIT_USERNAME}"
                    git config --global user.password "${GIT_PASSWORD}"
                    git config --global user.email "ericzacarias80@gmail.com"
                    git remote set-url origin https://ez98:${GIT_PASSWORD}@github.com/ez98/Eric-Zacarias.github.io.git
                    git checkout -b main
                    '''
                    withCredentials([string(credentialsId: 'API_TOKEN', variable: 'TOKEN')])
                    {
                        sh '''
                            chmod +x /home/jenkins/workspace/github-test/test.sh
                            /home/jenkins/workspace/github-test/test.sh $TOKEN $GIT_PASSWORD
                        '''
                    }
                }

                // withCredentials([string(credentialsId: 'API_TOKEN', variable: 'TOKEN')])
                // {
                //     sh '''
                //         chmod +x /home/jenkins/workspace/github-test/test.sh
                //         /home/jenkins/workspace/github-test/test.sh $TOKENcan 
                //     '''
                // }


            }
        }

        stage('Deliver') {
            steps {
                echo "====Pushing changelog to Github REPO===="
            }
        }
    }
}