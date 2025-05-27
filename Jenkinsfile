pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'Sonar-server' // Name configured in Jenkins > Manage Jenkins > Configure System
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kloi424/Jenkins-Sonarqube-Docker.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('Sonar-server') {
                    sh '''
                        /opt/sonar-scanner/bin/sonar-scanner \
                          -Dsonar.projectKey=Onix-Website \
                          -Dsonar.sources=. \
                          -Dsonar.host.url=http://16.171.112.147:9000/ \
                          -Dsonar.login=sqa_6ad09254c0edad142ada65487d355756e799629c
                    '''
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        success {
            echo 'SonarQube analysis passed!'
        }
        failure {
            echo 'SonarQube analysis failed or Quality Gate failed.'
        }
    }
}
