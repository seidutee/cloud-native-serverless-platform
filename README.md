# 🚀 Cloud-Native Serverless Student Management Platform on AWS

<p align="center">

![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![AWS Amplify](https://img.shields.io/badge/AWS-Amplify-FF9900?style=for-the-badge&logo=awsamplify&logoColor=white)
![AWS Lambda](https://img.shields.io/badge/AWS-Lambda-FF9900?style=for-the-badge&logo=awslambda&logoColor=white)
![Amazon API Gateway](https://img.shields.io/badge/API-Gateway-FF4F8B?style=for-the-badge)
![Amazon DynamoDB](https://img.shields.io/badge/DynamoDB-4053D6?style=for-the-badge&logo=amazondynamodb&logoColor=white)
![Amazon S3](https://img.shields.io/badge/Amazon-S3-569A31?style=for-the-badge&logo=amazons3&logoColor=white)
![Amazon Route53](https://img.shields.io/badge/Route53-8C4FFF?style=for-the-badge)
![Amazon CloudFront](https://img.shields.io/badge/CloudFront-FF9900?style=for-the-badge)
![Amazon ACM](https://img.shields.io/badge/AWS-ACM-FF9900?style=for-the-badge)

</p>

---

## 📖 Table of Contents

- Project Overview
- Architecture
- Features
- AWS Services Used
- CI/CD Pipeline
- Repository Structure
- Infrastructure Modules
- Deployment Workflow
- Testing
- Future Improvements
- Lessons Learned

---

# Project Overview

Awesome App is a fully serverless Student Management application built entirely on AWS using Infrastructure as Code (Terraform).

The project demonstrates how modern cloud-native applications can be deployed with:

- Infrastructure as Code
- Continuous Integration
- Continuous Deployment
- Serverless Computing
- Managed Frontend Hosting
- Secure API Design
- DNS & SSL Automation

This project was built as a portfolio project while learning Cloud Engineering and DevOps practices.

---

# Architecture

> Insert the architecture diagram here.

```
Client
   │
Route53
   │
AWS Certificate Manager
   │
Amplify Domain Association
   │
CloudFront (Managed by AWS Amplify)
   │
Amplify Hosting
   │
API Gateway
   │
───────────────
│             │
GET Lambda   PUT Lambda
│             │
──────┬────────
       │
 DynamoDB
```

---

# Features

- Student Registration
- Student Retrieval
- Fully Serverless Backend
- Responsive Frontend
- HTTPS using ACM
- Custom Domain with Route53
- Infrastructure Provisioned using Terraform
- GitHub Actions CI/CD
- Lambda Artifacts Stored in Amazon S3
- Automatic Frontend Deployment using AWS Amplify

---

# AWS Services Used

| Service | Purpose |
|----------|----------|
| AWS Amplify | Frontend Hosting |
| API Gateway | REST API |
| Lambda | Backend Compute |
| DynamoDB | Database |
| S3 | Lambda Artifact Storage |
| Route53 | DNS |
| ACM | SSL Certificates |
| CloudFront | CDN (Managed by Amplify) |
| IAM | Security |
| CloudWatch | Logs & Monitoring |

---

# Repository Structure

```text
cloud-native-serverless-platform/

.github/
    workflows/
        terraform-pr.yml
        terraform-deploy.yml
        lambda-deploy.yml

backend/
    get_item/
    put_item/

frontend/

terraform/
    environments/
    modules/

README.md
```

---

# Terraform Modules

```
terraform/modules

amplify/
apigateway/
dynamodb/
iam/
lambda/
route53/
s3/
```

Each AWS service is implemented as an independent reusable Terraform module.

---

# CI/CD Pipeline

## Pipeline 1

Terraform Validation

Trigger:

Pull Request

Runs:

- terraform fmt
- terraform validate
- terraform plan

No AWS resources are modified.

---

## Pipeline 2

Terraform Deployment

Trigger:

Merge into main

Runs:

- terraform apply

Deploys infrastructure updates.

---

## Pipeline 3

Lambda Deployment

Trigger:

Changes inside backend/

Runs:

- Package Lambda
- Upload artifacts to S3
- Deploy updated Lambda code

---

## Frontend Deployment

AWS Amplify automatically rebuilds the frontend whenever changes are pushed to GitHub.

No manual deployment is required.

---

# Deployment Workflow

Developer

↓

Git Push

↓

GitHub Actions

↓

Terraform Validation

↓

Terraform Apply

↓

Upload Lambda Artifacts

↓

AWS Infrastructure

↓

Amplify Build

↓

Student Management Application

---

# Testing

Terraform

```
terraform fmt

terraform validate

terraform plan

terraform apply
```

Lambda

```
curl -X POST \
https://<api-id>.execute-api.us-east-1.amazonaws.com/dev/students \
-H "Content-Type: application/json" \
-d '{"id":"1","name":"Alice"}'
```

GET

```
curl https://<api-id>.execute-api.us-east-1.amazonaws.com/dev/students
```

---

# Lessons Learned

During this project I gained hands-on experience with:

- Terraform Module Design
- AWS Lambda
- API Gateway HTTP APIs
- DynamoDB
- AWS Amplify
- GitHub Actions
- Route53
- AWS Certificate Manager
- Infrastructure as Code
- Serverless Architecture
- Cloud Architecture Design
- CI/CD Pipelines

---

# Future Improvements

- GitHub OIDC Authentication
- Multi-environment Deployments
- Automated Integration Tests
- Terraform Remote State Locking
- Blue/Green Lambda Deployments
- Monitoring Dashboards
- AWS WAF
- Cost Monitoring

---

# Author

**T. Seidu**

Cloud Engineer | DevOps Engineer

Building cloud-native infrastructure one project at a time.