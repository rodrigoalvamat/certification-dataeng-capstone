# Environment variables
variable "stage" {
  description = "Sets the deployment stage."
  type        = string
}

variable "module_traefik_enabled" {
  description = "Enable the traefik module."
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
  default     = "traefik"
}

variable "helm_release_name" {
  description = "Name of the helm release. Must be unique."
  type        = string
  default     = "traefik"
}

variable "helm_chart_name" {
  description = "Name of the helm chart."
  type        = string
  default     = "https://traefik.github.io/charts/traefik/traefik-21.1.0.tgz"
}
