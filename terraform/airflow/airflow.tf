# Terraform config
terraform {
  required_version = ">= 1.2.9"
  required_providers {
    helm       = ">= 2.9.0"
    kubernetes = ">= 2.18.1"
    kubectl    = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}

# Namespace
resource "kubernetes_namespace" "namespace_airflow" {
  count = var.module_airflow_enabled ? 1 : 0

  metadata {
    name = var.kubernetes_namespace
  }
}

# Airflow
resource "helm_release" "airflow" {
  depends_on = [kubernetes_namespace.namespace_airflow]
  namespace  = var.kubernetes_namespace

  name  = var.airflow_chart_release_name
  chart = var.airflow_chart_name
  wait  = false

  values = [
    file("${path.module}/resources/values.yaml")
  ]
}

# Airflow ingress
resource "kubectl_manifest" "airflow_ingress" {
  depends_on = [helm_release.airflow]

  yaml_body = file("${path.module}/resources/ingress.yaml")
}