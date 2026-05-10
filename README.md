````md
# 🚀 Deploy Prometheus and Grafana on Kubernetes using Terraform & Helm

---

# 📌 Project Title

## Deploy Prometheus and Grafana on Kubernetes using Terraform & Helm

---

# 📖 Project Overview

This project demonstrates deployment of a complete monitoring stack on Kubernetes using Infrastructure as Code (IaC) tools such as Terraform and Helm.

The monitoring stack includes:

- 📊 Prometheus for metrics collection and monitoring
- 📈 Grafana for dashboards and visualization
- ☸️ Kubernetes for container orchestration
- 🏗 Terraform for infrastructure automation
- ⚙️ Helm for Kubernetes package management

The project automates the deployment process for scalable and reusable cloud-native monitoring infrastructure.

---

# 🎯 Objective

The main objective of this project is to automate deployment of Prometheus and Grafana on Kubernetes using Terraform and Helm for:

- Infrastructure automation
- Monitoring setup
- Real-time visualization
- Reusable infrastructure
- Simplified DevOps operations

---

# 🛠 Technologies Used

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
| VS Code | Development environment |

---

# 📂 Project Structure

```text
monitoring-project/
│
├── screenshots/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── README.md
└── terraform.tfstate
```

---

# ☸️ Monitoring Architecture Diagram

```text
                         +----------------------+
                         |      Developer       |
                         +----------+-----------+
                                    |
                                    v
                         +----------------------+
                         |      Terraform       |
                         +----------+-----------+
                                    |
                                    v
                         +----------------------+
                         |     Helm Provider    |
                         +----------+-----------+
                                    |
                                    v
                  +--------------------------------------+
                  |      Kubernetes Cluster              |
                  |          (Minikube)                  |
                  +--------------------------------------+
                          |                    |
                          |                    |
                          v                    v

              +------------------+   +------------------+
              |    Prometheus    |   |     Grafana      |
              | Metrics Collector|   | Visualization UI |
              +------------------+   +------------------+
                          |                    |
                          +---------+----------+
                                    |
                                    v
                        +----------------------+
                        | Monitoring Dashboard |
                        +----------------------+
```

---

# 🔄 Complete Deployment Workflow

```text
Terraform Configuration
            ↓
Terraform Initialization
            ↓
Helm Charts Installation
            ↓
Kubernetes Namespace Creation
            ↓
Prometheus Deployment
            ↓
Grafana Deployment
            ↓
Pods & Services Created
            ↓
Port Forwarding
            ↓
Browser Access
            ↓
Monitoring Dashboard
```

---

# ⚙️ Prerequisites

Install the following software before starting:

| Software | Purpose |
|---|---|
| Docker Desktop | Container Runtime |
| Minikube | Kubernetes Cluster |
| kubectl | Kubernetes CLI |
| Terraform | Infrastructure Automation |
| Helm | Kubernetes Package Manager |
| VS Code | Code Editor |

---

# 🚀 STEP 1 — Start Minikube Cluster

Start Kubernetes cluster using Minikube.

```bash
minikube start
```

---

# Verify Cluster

```bash
kubectl get nodes
```

Expected Output:

```text
Ready
```

---

# 📸 Minikube Cluster Running

![Minikube](screenshots/minikube-start.png)

---

# 📊 Kubernetes Monitoring Architecture

```text
                    Kubernetes Cluster
                              |
      ------------------------------------------------
      |                                              |
      v                                              v

+--------------------+                 +--------------------+
|     Prometheus     |                 |      Grafana       |
|--------------------|                 |--------------------|
| Metrics Collection |                 | Dashboard UI       |
| Monitoring         |                 | Visualization      |
+--------------------+                 +--------------------+
```

---

# 🚀 STEP 2 — Initialize Terraform

Initialize Terraform project.

```bash
terraform init
```

Terraform downloads:

- Helm provider
- Kubernetes provider
- Required plugins

---

# 📸 Terraform Initialization

![Terraform Init](screenshots/terraform-init.png)

---

# 🚀 STEP 3 — Validate Terraform Configuration

Validate Terraform files.

```bash
terraform validate
```

Expected Output:

```text
Success! The configuration is valid.
```

---

# 🚀 STEP 4 — Preview Infrastructure Changes

Preview infrastructure before deployment.

```bash
terraform plan
```

This shows:

- Namespace creation
- Helm chart deployment
- Resources to be added

---

# 🚀 STEP 5 — Deploy Infrastructure

Deploy Prometheus and Grafana.

```bash
terraform apply
```

Type:

```bash
yes
```

Terraform automatically:

- Creates namespace
- Installs Prometheus
- Installs Grafana
- Creates services and pods

---

# 📸 Terraform Apply Output

![Terraform Apply](screenshots/terraform-apply.png)

---

# 🚀 STEP 6 — Verify Kubernetes Resources

---

# Check Pods

```bash
kubectl get pods -n monitoring
```

Expected Output:

```text
prometheus-server
grafana
```

---

# Check Services

```bash
kubectl get svc -n monitoring
```

---

# Check Helm Releases

```bash
helm list -n monitoring
```

---

# 📸 Running Pods

![Pods](screenshots/pods.png)

---

# 📸 Helm Releases

![Helm List](screenshots/helm-list.png)

---

# 🔄 Deployment Workflow Diagram

```text
Terraform Apply
        ↓
Helm Release
        ↓
Kubernetes Namespace
        ↓
Pods Created
        ↓
Services Exposed
        ↓
Monitoring Stack Running
```

---

# 🚀 STEP 7 — Access Prometheus

Run port forwarding:

```bash
kubectl port-forward svc/prometheus-server 9090:80 -n monitoring
```

Open browser:

```text
http://localhost:9090
```

Prometheus dashboard opens successfully.

---

# 📸 Prometheus Dashboard

![Prometheus UI](screenshots/prometheus-ui.png)

---

# 🚀 STEP 8 — Access Grafana

Run port forwarding:

```bash
kubectl port-forward svc/grafana 3000:80 -n monitoring
```

Open browser:

```text
http://localhost:3000
```

---

# 🔐 Grafana Login Credentials

| Username | Password |
|---|---|
| admin | admin123 |

---

# 📸 Grafana Dashboard

![Grafana Dashboard](screenshots/grafana-dashboard.png)

---

# 🚀 STEP 9 — Configure Grafana Data Source

Open Grafana.

Navigate to:

```text
Connections → Data Sources
```

Add Prometheus data source.

Use URL:

```text
http://prometheus-server.monitoring.svc.cluster.local
```

Click:

```text
Save & Test
```

---

# 🚀 STEP 10 — Import Kubernetes Dashboard

Import dashboard using ID:

```text
1860
```

This imports Kubernetes monitoring dashboard with:

- CPU Usage
- Memory Usage
- Pod Monitoring
- Cluster Metrics

---

# 📈 Monitoring Workflow

```text
Kubernetes Cluster
        ↓
Prometheus Collects Metrics
        ↓
Grafana Reads Metrics
        ↓
Dashboards Visualize Data
        ↓
Real-Time Monitoring
```

---

# 📄 Terraform Files

| File | Purpose |
|---|---|
| provider.tf | Provider configuration |
| main.tf | Helm releases and namespace |
| variables.tf | Variable definitions |
| outputs.tf | Output values |

---

# 🌟 Benefits of Terraform

- Infrastructure automation
- Reusable infrastructure
- Version-controlled deployments
- Consistent provisioning
- Faster DevOps workflow

---

# 🌟 Benefits of Helm

- Simplified Kubernetes deployments
- Easy package management
- Fast upgrades and rollback
- Dependency management
- Reusable Helm charts

---

# ✅ Advantages of the Project

- Automated monitoring setup
- Real-time infrastructure monitoring
- Cloud-native deployment
- Scalable monitoring architecture
- Infrastructure as Code implementation
- Easy Kubernetes management

---

# 🔮 Future Enhancements

- Add Alertmanager
- Configure Email Alerts
- Deploy on AWS EKS
- Add Node Exporter
- Implement CI/CD Pipeline
- Add Loki for log monitoring
- Integrate Prometheus Alert Rules

---

# 📚 Learning Outcomes

After completing this project, you will understand:

- Kubernetes monitoring
- Terraform automation
- Helm deployment
- Infrastructure as Code
- Prometheus architecture
- Grafana dashboard configuration
- Kubernetes namespace management
- Cloud-native monitoring systems

---

# 🏁 Conclusion

This project demonstrates complete deployment of a cloud-native monitoring stack using Terraform, Helm, Prometheus, and Grafana on Kubernetes.

The implementation provides practical understanding of:

- Infrastructure automation
- Kubernetes monitoring
- Helm package deployment
- Real-time visualization
- Scalable DevOps practices

This project reflects real-world DevOps and SRE monitoring workflows used in modern cloud environments.

---

# 👩‍💻 Author

## Samruddhi Pansare

---
````
