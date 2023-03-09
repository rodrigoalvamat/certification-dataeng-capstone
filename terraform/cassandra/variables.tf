# Environment variables
variable "stage" {
  description = "Sets the deployment stage."
  type        = string
}

variable "module_cassandra_enabled" {
  description = "Enable the cassandra module."
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
  default     = "cassandra"
}

# Helm variables
variable "chart_release_name" {
  description = "Name of the helm release. Must be unique."
  type        = string
  default     = "cassandra"
}

variable "chart_repository" {
  description = "URL of the helm repository."
  type        = string
  default     = "https://charts.bitnami.com/bitnami"
}

variable "chart_name" {
  description = "Name of the helm chart."
  type        = string
  default     = "https://charts.bitnami.com/bitnami/cassandra-9.7.5.tgz"
}

variable "chart_version" {
  description = "Version of the helm chart."
  type        = string
  default     = "9.7.5"
}