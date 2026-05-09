resource "kubernetes_namespace" "monitoring" {

  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prometheus" {

  name       = "prometheus"

  repository = "https://prometheus-community.github.io/helm-charts"

  chart      = "prometheus"

  namespace  = kubernetes_namespace.monitoring.metadata[0].name

  depends_on = [
    kubernetes_namespace.monitoring
  ]
}

resource "helm_release" "grafana" {

  name       = "grafana"

  repository = "https://grafana.github.io/helm-charts"

  chart      = "grafana"

  namespace  = kubernetes_namespace.monitoring.metadata[0].name

  values = [
    <<EOF
adminPassword: admin123
EOF
  ]

  depends_on = [
    helm_release.prometheus
  ]
}