
# 🚀 Blue-Green Deployment CI/CD on AWS EKS with Jenkins, Terraform & Kubernetes

This project demonstrates a **complete end-to-end DevOps pipeline** implementing **Blue-Green Deployment** strategy using:

- 🐳 **Docker** for containerization
- 🐙 **GitHub + Jenkins** for CI/CD automation
- ⚙ **Terraform** for infrastructure provisioning (IaC)
- ☸️ **Kubernetes (AWS EKS)** for container orchestration
- 🐝 **SonarQube & Trivy** for code & image security scanning
- 🐾 **Prometheus & Grafana** for monitoring & alerting

## 🔑 Key Highlights from the Pipeline

✅ Maven-based build & test stages  
🔍 Static code + Docker image security scan with **SonarQube & Trivy**  
📦 Build Docker image & push to **AWS ECR**, tagging for environments (blue / green)  
☸️ Deploy to **AWS EKS** using **kubectl**, dynamically switching environments  
🔀 Traffic is routed via `kubectl patch` to new service with **zero downtime**  
⚙️ Fully automated via Jenkins pipeline, using parameters to switch & validate

## ⚙ In this approach:

✅ Zero-downtime deployments by routing traffic between **Blue & Green** environments  
✅ CI/CD pipeline ensures fast, repeatable, and secure deployments  
✅ Rollbacks are simpler, reducing production risks & speeding up releases

## 🗂 Tech Stack

- Terraform + AWS EKS + ECR
- Jenkins (CI/CD), SonarQube, Trivy
- Kubernetes deployments (blue/green)
- Prometheus & Grafana dashboards

## 🚀 Local or Partial Demo

```bash
docker-compose up -d
```

| Tool        | URL               |
|-------------|-------------------|
| App         | http://localhost:8080 |
| Prometheus  | http://localhost:9090 |
| Grafana     | http://localhost:3000 |

## 🎯 To try this project:

1. Clone repo  
2. Configure Jenkins pipeline credentials & environment variables:
    - `AWS_ACCESS_KEY_ID`
    - `AWS_SECRET_ACCESS_KEY`
    - `KUBECONFIG`, `ECR_REPO`, etc
3. Trigger build from Jenkins or GitHub push
4. Enjoy automated, secure blue-green deployments 🚀

🙌 Thanks to the community & all references that helped this stack!
