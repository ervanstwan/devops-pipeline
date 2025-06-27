# DevOps CI/CD Pipeline with Terraform & GitHub Actions

This project demonstrates a full DevOps pipeline using:
- GitHub Actions for CI/CD
- Docker for containerization
- AWS ECS for deployment
- Terraform for infrastructure as code (IaC)
- Prometheus & Grafana for monitoring
- Telegram/Slack notifications for deployment status

## Getting Started
1. Clone repo
2. Configure GitHub Secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `TELEGRAM_TOKEN`, `TELEGRAM_CHAT_ID` or Slack Webhook
3. Run GitHub Actions

## Infrastructure
Managed via Terraform:
- ECS Cluster
- ECR Repository
- IAM Roles
