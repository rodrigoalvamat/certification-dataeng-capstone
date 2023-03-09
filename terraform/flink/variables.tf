# Environment variables
variable "stage" {
  description = "Sets the deployment stage."
  type        = string
}

variable "module_flink_enabled" {
  description = "Enable the flink module."
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
  default     = "flink"
}

# Kafka UI helm variables
variable "flink_chart_release_name" {
  description = "Name of the helm release. Must be unique."
  type        = string
  default     = "flink-operator"
}

variable "flink_chart_name" {
  description = "Name of the helm chart."
  type        = string
  default     = "https://downloads.apache.org/flink/flink-kubernetes-operator-1.4.0/flink-kubernetes-operator-1.4.0-helm.tgz"
}
