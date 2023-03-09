terraform {
  required_version = ">= 1.2.9"
  required_providers {
    kubernetes = ">= 2.18.1"
    kubectl    = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path    = var.kubernetes_config
    config_context = var.kubernetes_context
  }
}

provider "kubernetes" {
  config_path    = var.kubernetes_config
  config_context = var.kubernetes_context
}

provider "kubectl" {
  config_path    = var.kubernetes_config
  config_context = var.kubernetes_context
}

/*
module "airflow" {
  source                 = "./airflow"
  depends_on             = [module.minio, module.kafka]
  stage                  = var.stage
  module_airflow_enabled = var.module_airflow_enabled

  kubernetes_config  = var.kubernetes_config
  kubernetes_context = var.kubernetes_context
}
*/

module "argocd" {
  source                = "./argocd"
  stage                 = var.stage
  module_argocd_enabled = var.module_argocd_enabled

  kubernetes_config  = var.kubernetes_config
  kubernetes_context = var.kubernetes_context
}

/*
module "cassandra" {
  source                   = "./cassandra"
  stage                    = var.stage
  module_cassandra_enabled = var.module_cassandra_enabled

  kubernetes_config  = var.kubernetes_config
  kubernetes_context = var.kubernetes_context
}

module "cert_manager" {
  source                      = "./cert-manager"
  stage                       = var.stage
  module_cert_manager_enabled = var.module_cert_manager_enabled

  kubernetes_config  = var.kubernetes_config
  kubernetes_context = var.kubernetes_context
}

module "flink" {
  source     = "./flink"
  depends_on = [module.cert_manager]

  stage                = var.stage
  module_flink_enabled = var.module_flink_enabled

  kubernetes_config  = var.kubernetes_config
  kubernetes_context = var.kubernetes_context
}

module "kafka" {
  source     = "./kafka"
  depends_on = [module.traefik]

  stage                = var.stage
  module_kafka_enabled = var.module_kafka_enabled

  kubernetes_config  = var.kubernetes_config
  kubernetes_context = var.kubernetes_context

  docker_secret   = var.docker_secret
  docker_username = var.docker_username
  docker_password = var.docker_password
}

module "minio" {
  source     = "./minio"
  depends_on = [module.traefik]

  stage                = var.stage
  module_minio_enabled = var.module_minio_enabled

  kubernetes_config  = var.kubernetes_config
  kubernetes_context = var.kubernetes_context
}

module "traefik" {
  source                 = "./traefik"
  stage                  = var.stage
  module_traefik_enabled = var.module_traefik_enabled

  kubernetes_config  = var.kubernetes_config
  kubernetes_context = var.kubernetes_context
}

module "spark" {
  source               = "./spark"
  stage                = var.stage
  module_spark_enabled = var.module_spark_enabled

  kubernetes_config  = var.kubernetes_config
  kubernetes_context = var.kubernetes_context
}
*/
