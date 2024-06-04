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
                            git branch: 'main', credentialsId: 'Gittoken', url: 'https://github.com/ShailAdmin/Terraform.git'
                        }
                    }
                }
           }
         stage('plan') {
            steps {
                sh 'pwd;cd terraform/; terraform init'
                sh "sh 'pwd;cd terraform/; terraform plan -out tfplan"
                sh 'pwd;cd terraform/; terraform show -no-color tfplan > tfplan.txt'
                }
            }
        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }
            steps {
                script {
                    def plan = readFile 'terraform/tfplantxt'
                    input message : "Do you want apply the plan?",
                    parameters: [text(name: 'plan', description: 'Please review the plan', defaultValue: plan)]
                }
              }
            }
            stage('Apply') {
                steps {
                    sh 'pwd;cd terraform/; terraform apply -input=false tfplan'
                    }
                }
        }
    }
