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
resource "kubernetes_namespace" "namespace_flink" {
  count = var.module_flink_enabled ? 1 : 0

  metadata {
    name = var.kubernetes_namespace
  }
}

# Kafka UI
resource "helm_release" "flink_operator" {
  depends_on = [kubernetes_namespace.namespace_flink]
  namespace  = var.kubernetes_namespace

  name  = var.flink_chart_release_name
  chart = var.flink_chart_name

  values = [
    file("${path.module}/resources/values.yaml")
  ]
}
