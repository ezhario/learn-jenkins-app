pipeline {
    agent any

    stages {
        // comment
        /* multiple
        line
        comment 
        */
        // stage('Build') {
        //     agent {
        //         docker {
        //             image 'node:18-alpine'
        //             reuseNode true
        //         }
        //     }
        //     steps {
        //         sh '''
        //             ls -al
        //             node --version
        //             npm --version
        //             npm ci
        //             npm run build
        //             ls -al
        //         '''
        //     }
        // }
        stage ('test stage') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    # test -f build/index.html
                    npm test
                '''
            }
        }
        stage ('e2e') {
            agent {
                docker {
                    image 'mcr.microsoft.com/playwright:v1.51.1-noble'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    npm install serve
                    node_modules/.bin/serve -s build
                    npx playwright test
                '''
            }
        }
    }
    post {
        always {
            junit 'test-results/junit.xml'
        }
    }
}
