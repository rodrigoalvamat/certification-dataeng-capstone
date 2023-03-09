# Terraform config
terraform {
  required_version = ">= 1.2.9"
  required_providers {
    helm       = ">= 2.9.0"
    kubernetes = ">= 2.18.1"
  }
}

# Namespace
resource "kubernetes_namespace" "namespace_argocd" {
  count = var.module_argocd_enabled ? 1 : 0

  metadata {
    name = var.kubernetes_namespace
  }
}

# Argo-CD
resource "helm_release" "argocd" {
  depends_on = [kubernetes_namespace.namespace_argocd]
  namespace  = var.kubernetes_namespace

  name       = var.chart_release_name
  repository = var.chart_repository
  chart      = var.chart_name
  version    = var.chart_version

  values = [
    file("${path.module}/resources/values.yaml")
  ]
}
