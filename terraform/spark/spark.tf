# Terraform config
terraform {
  required_version = ">= 1.2.9"
  required_providers {
    helm       = ">= 2.7.1"
    kubernetes = ">= 2.15.0"
  }
}

# Namespace
resource "kubernetes_namespace" "namespace_spark" {
  count = var.module_spark_enabled ? 1 : 0

  metadata {
    name = var.kubernetes_namespace
  }
}

# Spark
resource "helm_release" "spark" {
  depends_on = [kubernetes_namespace.namespace_spark]
  namespace  = var.kubernetes_namespace

  name       = var.chart_release_name
  //repository = var.chart_repository
  chart      = var.chart_name
  //version    = var.chart_version

  values = [
    file("${path.module}/resources/values.yaml")
  ]
}