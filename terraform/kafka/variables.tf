# Environment variables
variable "stage" {
  description = "Sets the deployment stage."
  type        = string
}

variable "module_kafka_enabled" {
  description = "Enable the kafka module."
  type        = bool
}

# Kubernetes variables
variable "kubernetes_config" {
  description = "Value of KUBECONFIG environment variable."
  type        = string
}

variable "kubernetes_context" {
  description = "Kubernetes cluster context."
  type        = string
}

variable "kubernetes_namespace" {
  description = "Name of the kubernetes cluster's namespace."
  type        = string
  default     = "kafka"
}

# Docker variables
variable "docker_secret" {
  description = "Docker secret credentials."
  type        = string
}

variable "docker_username" {
  description = "Docker registry username."
  type        = string
  sensitive   = true
}

variable "docker_password" {
  description = "Docker registry password."
  type        = string
  sensitive   = true
}

# Kafka UI helm variables
variable "ui_chart_release_name" {
  description = "Name of the helm release. Must be unique."
  type        = string
  default     = "kafka-ui"
}

variable "ui_chart_repository" {
  description = "URL of the helm repository."
  type        = string
  default     = "https://provectus.github.io/kafka-ui"
}

variable "ui_chart_name" {
  description = "Name of the helm chart."
  type        = string
  default     = "kafka-ui"
}

variable "ui_chart_version" {
  description = "Version of the helm chart."
  type        = string
  default     = "0.5.3"
}