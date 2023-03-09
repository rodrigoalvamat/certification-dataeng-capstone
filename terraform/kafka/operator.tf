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
resource "kubernetes_namespace" "namespace_kafka" {
  count = var.module_kafka_enabled ? 1 : 0

  metadata {
    name = var.kubernetes_namespace
  }
}

# Strimzi admin
resource "kubectl_manifest" "strimzi_admin" {
  depends_on         = [kubernetes_namespace.namespace_kafka]
  override_namespace = var.kubernetes_namespace

  for_each  = fileset(path.module, "resources/operator/strimzi-admin/*.yaml")
  yaml_body = file("${path.module}/${each.value}")
}

# Kafka cluster operator
resource "kubectl_manifest" "kafka_cluster_operator" {
  depends_on         = [kubectl_manifest.strimzi_admin]
  override_namespace = var.kubernetes_namespace

  for_each  = fileset(path.module, "resources/operator/cluster-operator/*.yaml")
  yaml_body = file("${path.module}/${each.value}")
}
