# Environment variables
variable "stage" {
  description = "Sets the deployment stage."
  type        = string
}

variable "module_minio_enabled" {
  description = "Enable the minio module."
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

variable "kubernetes_operator_namespace" {
  description = "Name of the kubernetes cluster's namespace."
  type        = string
  default     = "minio-operator"
}

variable "kubernetes_tenant_namespace" {
  description = "Name of the kubernetes cluster's namespace."
  type        = string
  default     = "minio-tenant"
}

# Helm variables
variable "operator_release_name" {
  description = "Name of the helm release. Must be unique."
  type        = string
  default     = "minio-operator"
}

variable "tenant_release_name" {
  description = "Name of the helm release. Must be unique."
  type        = string
  default     = "minio-tenant"
}

variable "operator_chart_name" {
  description = "Name of the helm chart."
  type        = string
  default     = "https://raw.githubusercontent.com/minio/operator/master/helm-releases/operator-4.5.8.tgz"
}

variable "tenant_chart_name" {
  description = "Name of the helm chart."
  type        = string
  default     = "https://raw.githubusercontent.com/minio/operator/master/helm-releases/tenant-4.5.8.tgz"
}
