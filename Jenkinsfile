pipeline {
  agent {
    node {
      label 'master'
    }

  }
    stages {
    stage('Node Install ') {
      steps {
        tool name: 'nodejs', type: 'nodejs'
        sh 'npm install'
      }
    }   

        stage('Test and coverage') {
          steps {
            
            sh 'npm i -D jest-junit'
            sh 'npm i -D jest-sonar-reporter'
            sh 'npm test -- --coverage --watchAll=flase'
          }
        }

  }
}
