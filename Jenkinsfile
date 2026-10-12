
pipeline {
    agent any

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'stg', 'prod'],
            description: 'Choose the Terraform environment'
        )
    }

    environment {
        AWS_ACCESS_KEY_ID     = 'test'
        AWS_SECRET_ACCESS_KEY = 'test'
        AWS_DEFAULT_REGION    = 'us-east-1'
        TF_IN_AUTOMATION      = 'true'
        TF_INPUT              = 'false'
        TF_VAR_floci_endpoint = 'http://floci:4566'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Terraform Files') {
            steps {
                sh '''
                    terraform version
                    test -f providers.tf
                    test -f variables.tf
                    test -f vpc.tf
                    test -f outputs.tf
                    test -f "${ENVIRONMENT}.tfvars"
                '''
            }
        }

        stage('Terraform Format') {
            steps {
                sh 'terraform fmt -check -recursive'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                    terraform plan \
                        -input=false \
                        -var-file="${params.ENVIRONMENT}.tfvars" \
                        -out=tfplan
                """
            }
        }
    }

    post {
        success {
            echo 'Terraform pipeline completed successfully.'
        }

        failure {
            echo 'Terraform pipeline failed. Check the console output.'
        }

        always {
            cleanWs()
        }
    }
}
