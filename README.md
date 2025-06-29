# Blue-Green Deployment CI/CD with Jenkins, Terraform, Kubernetes on AWS EKS

This project demonstrates:
- Maven build & test
- Static & image security scans (SonarQube + Trivy)
- Docker build & push to Nexus (blue/green tags)
- Kubernetes deploy on AWS EKS with conditional patching
- Zero-downtime blue-green switch
- Jenkins parameters for environment switch
- Terraform to provision EKS & IAM
- Prometheus & Grafana monitoring

## Getting Started
1. Clone the repo
2. Set Jenkins credentials & secrets:
   - `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`
   - `NEXUS_USER`, `NEXUS_PASSWORD`
   - `SONAR_TOKEN`
3. Run pipeline in Jenkins

## Highlights
✅ Zero downtime deployment by routing traffic between blue & green deployments.  
✅ CI/CD pipelines ensure fast, repeatable, reliable deployments.  
✅ Rollback made easy by switching selector back.

## Jenkins Pipeline Stages
- Build & Unit Test
- Sonar Scan
- Docker Build & Push
- K8s Deploy
- Patch Service (Blue/Green switch)
- Notify via Slack or Telegram