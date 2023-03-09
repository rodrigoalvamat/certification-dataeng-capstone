# Docker secret
/*
resource "kubernetes_secret" "docker_secret" {
  depends_on = [kubectl_manifest.kafka_cluster]
  metadata {
    name      = var.docker_secret
    namespace = var.kubernetes_namespace
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "https://index.docker.io/v1/" = {
          "auth" = base64encode("${var.docker_username}:${var.docker_password}")
        }
        "https://index.docker.io/v2/" = {
          "auth" = base64encode("${var.docker_username}:${var.docker_password}")
        }
      }
    })
  }
}
*/

# Kafka connect
/*
resource "kubectl_manifest" "kafka_connect" {
  depends_on         = [kubernetes_secret.docker_secret]
  override_namespace = var.kubernetes_namespace

  yaml_body = file("${path.module}/resources/connect/connect.yaml")
}
*/
