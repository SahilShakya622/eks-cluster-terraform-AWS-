# 🛠️ EKS Cluster on AWS using Terraform (Modular Setup)

This project provisions a fully functional, production-ready Amazon EKS cluster using Terraform with a modular architecture.

---

## 📁 Folder Structure

eks-cluster-terraform/
├── main.tf
├── provider.tf
├── outputs.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   └── outputs.tf
│   └── eks/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf



---

## 🚀 Features

- ☁️ Highly Available VPC across 3 AZs
- 🎯 EKS cluster with SPOT & ON-DEMAND node group (capacity-optimized)
- 🔐 IAM roles with managed policies
- 🌐 VPC Interface Endpoint for EKS API
- 📦 Clean Terraform module structure
- 🔄 Compatible with Terraform 1.4+ and AWS Provider 5.x+

---

## ✅ Prerequisites

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- AWS IAM user with programmatic access and necessary permissions

---

## 🧭 Usage

### 1️⃣ Clone the repository

git clone https://github.com/your-username/eks-cluster-terraform.git
cd eks-cluster-terraform

### 2️⃣ Initialize Terraform

terraform init

### 3️⃣ Review and apply the plan

terraform plan
terraform apply

---

### 🔑 Access the EKS Cluster
After deployment:
aws eks update-kubeconfig --region us-east-1 --name my-eks-cluster

kubectl get nodes

---

### 🧼 Cleanup
To delete all AWS resources created by this project:
terraform destroy

---

### 📌 Notes
.terraform/ and .tfstate files are not committed (see .gitignore)
You can use this setup as a foundation to add:
Ingress Controllers
Helm Charts
GitOps / CI-CD Pipelines
Monitoring and logging

---

### 👨‍💻 Author
Sahil Shakya
GitHub
Terraform | AWS | Kubernetes | DevOps
