pipeline {
  agent any
  environment {
    AWS_DEFAULT_REGION="us-east-2"
  }
  stages {
    stage('Get Author Name'){
      when{ expression {env.GIT_AUTHOR != 'Jenkins CI' && env.BRANCH_NAME == 'master'} }
      steps{
        script{
          env.GIT_AUTHOR = sh(script: "eval git --no-pager show -s --format=\'%an\'", returnStdout: true).trim()
        }
      }
    }
    stage('Checkout Code') {
      when{ expression {env.GIT_AUTHOR != 'Jenkins CI'} }
      steps{
        git changelog: false,
        credentialsId: 'bitbucket-devops',
        poll: false,
        url: 'ssh://git@internal-bitbucket-p-app-clb-621196423.us-east-1.elb.amazonaws.com/edr/tfe-mongodbatlas-project-enterprise-module.git',
        branch: env.BRANCH_NAME
      }
    }
    stage('Terraform lint check') {
      when{
        anyOf{
          branch 'feature/*'
          branch 'fix/*'
        }
      }
      steps {
        echo "todo add provider then re-add"
        /*
        sh '''
          terraform13 init
          terraform13 validate
        '''
        */
      }
    }
    stage('Create tag'){
      when{ expression {env.GIT_AUTHOR != 'Jenkins CI' && env.BRANCH_NAME == 'master'} }
      steps {
        sh """
          git fetch --tags --depth=1000 --prune
          if [ `git rev-parse --abbrev-ref HEAD` != "master" ]
          then
            git branch --track master origin/master
          fi
          git-chglog -next-tag `autotag -n` -o CHANGELOG.md
          git config user.name 'Jenkins CI'
          git add CHANGELOG.md; git commit -m "updated CHANGELOG"; git push
          autotag; git push origin --tags
        """
      }
    }
  }
  post {
    always {
      echo "Cleaning up Workspace"
      deleteDir() /* clean up our workspace */
    }
  }
}
