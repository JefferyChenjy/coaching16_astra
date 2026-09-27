# Smart Manufacturing Operational Intelligence & Cloud Infrastructure

![Build Status](https://github.com/JefferyChenjy/coaching16_astra/actions/workflows/terraform-ci.yaml/badge.svg)
![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?logo=amazon-aws)
![Security](https://img.shields.io/badge/Security-Checkov-FF69B4)

## 📌 Project Overview

This repository contains the cloud infrastructure configuration, CI/CD pipeline automation, and core application modules for an enterprise-grade Smart Manufacturing Operational Intelligence platform. 

The platform leverages cloud-native infrastructure to run predictive analytics, explainable AI (XAI) workflows, and industrial IoT sensor monitoring at scale. All cloud resources are managed using **Infrastructure as Code (IaC)** with Terraform and validated through automated security scanning pipelines.

---

## 🏗 Architecture & Cloud Infrastructure

The underlying infrastructure is deployed on AWS using modular Terraform blueprints designed for scalability, security, and high availability.

* **Compute & Storage:** Containerized microservices and automated storage buckets (`aws_s3_bucket`) for industrial sensor ingestion and analytical data lake management.
* **Security & Compliance:** Built-in static code security analysis using **Checkov** to enforce compliance with AWS security best practices (logging, encryption, access control).
* **Automated CI/CD:** Integrated GitHub Actions workflows (`.github/workflows/terraform-ci.yaml`) for automated testing, linting, security scanning, and seamless deployments.

---

## 🛠 Tech Stack

* **Infrastructure as Code (IaC):** Terraform
* **Cloud Provider:** Amazon Web Services (AWS)
* **CI/CD & DevOps:** GitHub Actions, OIDC Authentication (`aws-actions/configure-aws-credentials`), Checkov
* **Data & AI Stack:** Python, Predictive Analytics Engine, NLP, Explainable AI (XAI)
* **Version Control & Flow:** Git, GitHub Feature Branching & Pull Request Workflow

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your local machine:

* [Terraform](https://www.terraform.io/downloads) (>= 1.0.0)
* [AWS CLI](https://aws.amazon.com/cli/) configured with proper IAM credentials
* [Checkov](https://www.checkov.io/) for local security testing
* [Git](https://git-scm.com/)

### Local Development Setup

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/JefferyChenjy/coaching16_astra.git](https://github.com/JefferyChenjy/coaching16_astra.git)
   cd coaching16_astra
