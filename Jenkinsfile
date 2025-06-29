pipeline {
  agent any
  parameters {
    choice(name: 'ENV_COLOR', choices: ['blue', 'green'], description: 'Deploy color')
  }
  stages {
    stage('Build & Test') {
      steps { sh 'mvn clean install' }
    }
    stage('SonarQube Scan') {
      steps {
        withSonarQubeEnv('SonarQube') { sh 'mvn sonar:sonar' }
      }
    }
    stage('Trivy Scan') {
      steps { sh 'trivy image myapp:latest' }
    }
    stage('Docker Build & Push') {
      steps {
        script {
          dockerImage = docker.build("nexus.example.com/myapp:${params.ENV_COLOR}")
          docker.withRegistry('http://nexus.example.com', 'nexus-cred') {
            dockerImage.push()
          }
        }
      }
    }
    stage('K8s Deploy') {
      steps { sh "kubectl apply -f k8s/deployment-${params.ENV_COLOR}.yaml" }
    }
    stage('Patch Service') {
      steps { sh "kubectl patch svc myapp-svc -p '{"spec":{"selector":{"color":"${params.ENV_COLOR}"}}}'" }
    }
  }
}