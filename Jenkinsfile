pipeline {
  agent any
  
  environment {
    Name = 'Test'
  }

  options {
    disableConcurrentBuilds()
  }
  
  stages {
    stage('pre-build') {
      when {
        anyOf {
          branch 'master'
        }
      }
      
      agent {
        docker {
          image 'node:14.15.1'
          reuseNode true
        }
      }
      
      steps {
        sh "printenv"
        echo "pre-build"
        echo "test 1"
      }
    }
    
    stage('build-env') {
      when {
        anyOf {
          branch 'master'
        }
      }  
      
      failFast false
      
      parallel {
        stage('build') {
          when {
              beforeAgent true
              branch 'master'
          }
          
          agent {
            docker {
              image 'node:14.15.1'
              reuseNode true
            }
          }
          
          steps {
            echo "build"
          }
        }
      }
    }
  }
}
