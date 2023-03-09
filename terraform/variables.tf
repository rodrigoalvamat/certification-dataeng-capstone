# Environment variables
variable "stage" {
  description = "Sets the deployment stage."
  type        = string
  default     = "dev"
}

# Kubernetes variables
variable "kubernetes_config" {
  description = "Value of KUBECONFIG environment variable."
  type        = string
  default     = "~/.kube/config"
}

variable "kubernetes_context" {
  description = "Kubernetes cluster context."
  type        = string
  default     = "default"
}

variable "module_airflow_enabled" {
  description = "Enable the airflow module."
  type        = bool
  default     = true
}

variable "module_argocd_enabled" {
  description = "Enable the argocd module."
  type        = bool
  default     = true
}

variable "module_cassandra_enabled" {
  description = "Enable the cassandra module."
  type        = bool
  default     = true
}

variable "module_cert_manager_enabled" {
  description = "Enable the cert manager module."
  type        = bool
  default     = true
}

variable "module_flink_enabled" {
  description = "Enable the flink module."
  type        = bool
  default     = true
}

variable "module_kafka_enabled" {
  description = "Enable the kafka module."
  type        = bool
  default     = true
}

variable "module_minio_enabled" {
  description = "Enable the minio module."
  type        = bool
  default     = true
}

variable "module_spark_enabled" {
  description = "Enable the spark module."
  type        = bool
  default     = true
}

variable "module_traefik_enabled" {
  description = "Enable the traefik module."
  type        = bool
  default     = true
}

# Docker variables
variable "docker_secret" {
  description = "Docker secret credentials."
  type        = string
  default     = "docker-secret"
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
