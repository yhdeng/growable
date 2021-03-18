pipeline {
  agent any
  
  environment {
    Name = 'Test'
    cacheDir = "stage"
    cachePackage = "${cacheDir}/package.json"
    cacheCommitIDFile = "${cacheDir}/.commitIDCache.txt"
    artifactsDir = "${cacheDir}/artifacts"
    resetFlagFile = "${cacheDir}/.resetFile"
    cacheCommitIDMax = 3
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
        chmod +x ./pre-build.sh
        sh './pre-build.sh'
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
