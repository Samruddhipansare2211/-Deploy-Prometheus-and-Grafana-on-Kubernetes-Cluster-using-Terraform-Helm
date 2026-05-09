# Deploy Prometheus and Grafana on Kubernetes using Terraform & Helm

## Project Overview

This project demonstrates how to deploy a complete monitoring stack on a Kubernetes cluster using Infrastructure as Code (IaC) tools such as Terraform and Helm.

The monitoring stack includes:

- Prometheus for monitoring and metrics collection
- Grafana for visualization and dashboards
- Kubernetes for container orchestration
- Terraform for infrastructure automation
- Helm for Kubernetes package management

---

# Objective

To automate deployment of Prometheus and Grafana on Kubernetes using Terraform and Helm for consistent, scalable, and reusable infrastructure management.

---

# Technologies Used

| Technology | Purpose |
|---|---|
| Kubernetes | Container orchestration |
| Minikube | Local Kubernetes cluster |
| Terraform | Infrastructure as Code |
| Helm | Kubernetes package manager |
| Prometheus | Monitoring tool |
| Grafana | Visualization dashboard |
| kubectl | Kubernetes command line |
| Docker Desktop | Container runtime |

---

# Project Architecture

```text
Terraform
   ↓
Helm Provider
   ↓
Kubernetes Cluster
   ↓
Prometheus + Grafana
   ↓
Monitoring Dashboard
```

---

# Prerequisites

Install the following software before starting:

- Docker Desktop
- Minikube
- kubectl
- Terraform
- Helm
- VS Code

---

# Installation Steps

## Step 1 — Start Minikube

```bash
minikube start
```

---

## Step 2 — Verify Cluster

```bash
kubectl get nodes
```

---

## Step 3 — Initialize Terraform

```bash
terraform init
```

---

## Step 4 — Validate Configuration

```bash
terraform validate
```

---

## Step 5 — Preview Infrastructure

```bash
terraform plan
```

---

## Step 6 — Deploy Infrastructure

```bash
terraform apply
```

Type:

```bash
yes
```

---

# Verify Deployment

## Check Pods

```bash
kubectl get pods -n monitoring
```

---

## Check Helm Releases

```bash
helm list -n monitoring
```

---

# Access Prometheus

Run:

```bash
kubectl port-forward svc/prometheus-server 9090:80 -n monitoring
```

Open browser:

```text
http://localhost:9090
```

---

# Access Grafana

Run:

```bash
kubectl port-forward svc/grafana 3000:80 -n monitoring
```

Open browser:

```text
http://localhost:3000
```

Login Credentials:

| Username | Password |
|---|---|
| admin | admin123 |

---

# Configure Grafana

1. Open Grafana
2. Go to Connections → Data Sources
3. Add Prometheus
4. Use URL:

```text
http://prometheus-server.monitoring.svc.cluster.local
```

5. Save & Test

---

# Import Dashboard

Use Dashboard ID:

```text
1860
```

This imports Kubernetes monitoring dashboard.

---

# Terraform Files

| File | Purpose |
|---|---|
| provider.tf | Provider configuration |
| main.tf | Helm releases and namespace |
| variables.tf | Variable definitions |
| outputs.tf | Output values |

---

# Project Structure

```text
monitoring-project/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── README.md
└── screenshots/
    ├── pods.png
    ├── prometheus-ui.png
    └── grafana-dashboard.png
```

---

# Screenshots

## Running Pods

Add screenshot here:

```text
screenshots/pods.png
```

---

## Prometheus UI

Add screenshot here:

```text
screenshots/prometheus-ui.png
```

---

## Grafana Dashboard

Add screenshot here:

```text
screenshots/grafana-dashboard.png
```

---

# Benefits of Terraform and Helm

## Terraform
- Infrastructure automation
- Version control
- Reusable infrastructure
- Consistent deployment

## Helm
- Easy Kubernetes application deployment
- Package management
- Simplified upgrades
- Dependency handling

---

# Advantages of Project

- Automated monitoring deployment
- Scalable infrastructure
- Real-time monitoring
- Easy management using IaC
- Faster DevOps setup

---

# Future Enhancements

- Add Alertmanager
- Deploy on AWS EKS
- Configure email alerts
- Add node exporters
- Implement CI/CD pipeline

---

# Author

Samruddhi Pansare

---

# License

This project is for educational and learning purposes.
