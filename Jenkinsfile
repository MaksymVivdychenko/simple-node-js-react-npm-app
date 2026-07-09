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
// Use npx to download and run 'serve' without installing it globally
                sh 'npx serve -s dist -l 3000 &' 
                
                // Pause here so you can view it
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                
                // Clean up the port when you are done
                sh 'npx kill-port 3000 || true'
            }
        }
    }
}