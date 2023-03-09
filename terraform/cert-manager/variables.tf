# Environment variables
variable "stage" {
  description = "Sets the deployment stage."
  type        = string
}

variable "module_cert_manager_enabled" {
  description = "Enable the cert manager module."
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
  default     = "cert-manager"
}

# Helm variables
variable "chart_release_name" {
  description = "Name of the helm release. Must be unique."
  type        = string
  default     = "cert-manager"
}

variable "chart_name" {
  description = "Name of the helm chart."
  type        = string
  default     = "https://charts.jetstack.io/charts/cert-manager-v1.11.0.tgz"
}
