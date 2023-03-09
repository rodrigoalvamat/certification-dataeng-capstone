# Kafka topics

/*
resource "kubectl_manifest" "kafka_topics" {
  depends_on         = [kubectl_manifest.kafka_cluster]
  override_namespace = var.kubernetes_namespace

  for_each  = fileset(path.module, "resources/topics/*.yaml")
  yaml_body = file("${path.module}/${each.value}")
}
*/