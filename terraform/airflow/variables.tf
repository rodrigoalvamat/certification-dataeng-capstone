# Environment variables
variable "stage" {
  description = "Sets the deployment stage."
  type        = string
}

variable "module_airflow_enabled" {
  description = "Enable the airflow module."
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
  default     = "airflow"
}

# Helm variables
variable "airflow_chart_release_name" {
  description = "Name of the helm release. Must be unique."
  type        = string
  default     = "airflow"
}

variable "airflow_chart_name" {
  description = "Name of the helm chart."
  type        = string
  default     = "https://downloads.apache.org/airflow/helm-chart/1.8.0/airflow-1.8.0.tgz"
}