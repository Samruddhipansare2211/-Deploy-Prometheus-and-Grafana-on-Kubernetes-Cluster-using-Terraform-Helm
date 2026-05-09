terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.27.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.13.2"
    }
  }
}

provider "kubernetes" {
  config_path = "C:/Users/SAMRUDDHI/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "C:/Users/SAMRUDDHI/.kube/config"
  }
}