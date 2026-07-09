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
        stage('Deliver'){
            steps{
                // 1. Install 'serve' globally inside the container to host the static build
                sh 'npm install -g serve'
                
                // 2. Serve the built app on port 3000 in the background
                sh 'serve -s dist -l 3000 &' 
                
                // 3. Pause here so you can view it
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                
                // 4. Clean up the port when you are done
                sh 'npx kill-port 3000 || true'
            }
        }
    }
}