// Jenkinsfile
String credentialsId = 'awsCredentials'

try {
  stage('checkout') {
    node {
      cleanWs()
      env.PATH = "${tool 'Terraform'}:${env.PATH}"
      checkout scm
    }
  }

  // Run terraform init
  stage('init') {
    node {
      ansiColor('xterm') {
        sh '''
          cd deployment
          terraform init
        '''
      }
    }
  }

  // Run terraform plan
  stage('plan') {
    node {
      ansiColor('xterm') {
        sh '''
        cd deployment
        terraform plan -out=tfplan
        '''
      }
    }
  }

  if (env.BRANCH_NAME == 'master') {
    stage('approval') {
      options {
        timeout(time: 1, unit: 'HOURS') 
      }
      steps {
        input 'approve the plan to proceed and apply'
      }
    }

  //   // Run terraform apply
  //   stage('apply') {
  //     node {
  //       withCredentials([[
  //         $class: 'AmazonWebServicesCredentialsBinding',
  //         credentialsId: credentialsId,
  //         accessKeyVariable: 'AWS_ACCESS_KEY_ID',
  //         secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
  //       ]]) {
  //         ansiColor('xterm') {
  //           sh 'terraform apply -auto-approve'
  //         }
  //       }
  //     }
  //   }

  //   // Run terraform show
  //   stage('show') {
  //     node {
  //       withCredentials([[
  //         $class: 'AmazonWebServicesCredentialsBinding',
  //         credentialsId: credentialsId,
  //         accessKeyVariable: 'AWS_ACCESS_KEY_ID',
  //         secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
  //       ]]) {
  //         ansiColor('xterm') {
  //           sh 'terraform show'
  //         }
  //       }
  //     }
  //   }
  }
  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}
