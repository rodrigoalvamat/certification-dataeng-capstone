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
resource "kubernetes_namespace" "namespace_operator" {
  count = var.module_minio_enabled ? 1 : 0

  metadata {
    name = var.kubernetes_operator_namespace
  }
}

# Namespace
resource "kubernetes_namespace" "namespace_tenant" {
  count = var.module_minio_enabled ? 1 : 0

  metadata {
    name = var.kubernetes_tenant_namespace
  }
}

# MinIO operator
resource "helm_release" "minio_operator" {
  depends_on = [kubernetes_namespace.namespace_operator]
  namespace  = var.kubernetes_operator_namespace

  name  = var.operator_release_name
  chart = var.operator_chart_name

  values = [
    file("${path.module}/resources/operator/values.yaml")
  ]
}

# MinIO operator ingress
resource "kubectl_manifest" "minio_operator_ingress" {
  depends_on = [helm_release.minio_operator]

  yaml_body = file("${path.module}/resources/operator/ingress.yaml")
}

# MinIO tenant
resource "helm_release" "minio_tenant" {
  depends_on = [kubernetes_namespace.namespace_tenant, helm_release.minio_operator]
  namespace  = var.kubernetes_tenant_namespace

  name  = var.tenant_release_name
  chart = var.tenant_chart_name

  values = [
    file("${path.module}/resources/tenant/values.yaml")
  ]
}