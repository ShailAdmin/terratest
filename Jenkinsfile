pipeline {
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    agent any
    tools {
      terraform 'terraform'
        }

        stages {
            stage('checkout') {
                steps {
                    script{
                        dir("terraform")
                        {
                            git branch: 'main', credentialsId: 'Gittoken', url: 'https://github.com/ShailAdmin/terratest.git'
                        }
                    }
                }
           }
         stage('plan') {
            steps {
                sh 'pwd; terraform init'
                sh  'pwd; terraform plan -out tfplan'
                sh 'pwd ; terraform apply "tfplan"'
                }
            }
        }
    }
