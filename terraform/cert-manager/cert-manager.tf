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
resource "kubernetes_namespace" "namespace_cert_manager" {
  count = var.module_cert_manager_enabled ? 1 : 0

  metadata {
    name = var.kubernetes_namespace
  }
}

# Cert manager
resource "helm_release" "cert_manager" {
  depends_on = [kubernetes_namespace.namespace_cert_manager]
  namespace  = var.kubernetes_namespace

  name       = var.chart_release_name
  chart      = var.chart_name

  values = [
    file("${path.module}/resources/values.yaml")
  ]
}