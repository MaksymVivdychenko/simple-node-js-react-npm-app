pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            parallel {
                stage('Run Application Server') {
                    steps {
                        // Using local npx to host your 'build' output directory directly
                        // This stays running actively in the foreground inside its own parallel branch
                        sh 'npx serve -s build -l 3000'
                    }
                }
                stage('User Verification') {
                    steps {
                        // Give the server 3 seconds to spin up completely
                        sleep time: 3, unit: 'SECONDS'
                        
                        // Jenkins pauses here cleanly to let you test http://localhost:3000
                        input message: 'Is the website running fine at http://localhost:3000? Click Proceed to finish.'
                    }
                }
            }
        }
    }
}