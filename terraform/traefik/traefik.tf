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
resource "kubernetes_namespace" "namespace_traefik" {
  count = var.module_traefik_enabled ? 1 : 0

  metadata {
    name = var.kubernetes_namespace
  }
}

# Traefik proxy
resource "helm_release" "traefik_proxy" {
  depends_on = [kubernetes_namespace.namespace_traefik]
  namespace  = var.kubernetes_namespace

  name  = var.helm_release_name
  chart = var.helm_chart_name

  values = [
    file("${path.module}/resources/values.yaml")
  ]
}

# Argo-CD ingress
resource "kubectl_manifest" "argocd_ingress" {
  depends_on         = [helm_release.traefik_proxy]

  yaml_body = file("${path.module}/resources/ingress/argocd.yaml")
}