# Kafka cluster

resource "kubectl_manifest" "kafka_cluster" {
  depends_on         = [kubectl_manifest.kafka_cluster_operator]
  override_namespace = var.kubernetes_namespace

  yaml_body = file("${path.module}/resources/kafka/kafka.yaml")
}

# Kafka topic operator
/*
resource "kubectl_manifest" "kafka_topic_operator" {
  depends_on         = [kubectl_manifest.kafka_cluster]
  override_namespace = var.kubernetes_namespace

  for_each  = fileset(path.module, "resources/operator/topic-operator/*.yaml")
  yaml_body = file("${path.module}/${each.value}")
}
*/

# Kafka user operator
/*
resource "kubectl_manifest" "kafka_user_operator" {
  depends_on         = [kubectl_manifest.kafka_cluster]
  override_namespace = var.kubernetes_namespace

  for_each  = fileset(path.module, "resources/operator/user-operator/*.yaml")
  yaml_body = file("${path.module}/${each.value}")
}
*/

# Kafka UI
resource "helm_release" "kafka_ui" {
  depends_on = [kubectl_manifest.kafka_cluster]
  namespace  = var.kubernetes_namespace

  name       = var.ui_chart_release_name
  repository = var.ui_chart_repository
  chart      = var.ui_chart_name
  version    = var.ui_chart_version

  set {
    name  = "envs.config.KAFKA_CLUSTERS_0_NAME"
    value = "local"
  }

  set {
    name  = "envs.config.KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS"
    value = "kafka-kafka-bootstrap:9092"
  }

  set {
    name  = "envs.config.KAFKA_CLUSTERS_0_ZOOKEEPER"
    value = "kafka-zookeeper-client:2181"
  }

  set {
    name = "service.port"
    value = 8080
  }
}

# Kafka UI ingress
resource "kubectl_manifest" "kafka_ui_ingress" {
  depends_on         = [helm_release.kafka_ui]

  yaml_body = file("${path.module}/resources/kafka/ingress.yaml")
}
