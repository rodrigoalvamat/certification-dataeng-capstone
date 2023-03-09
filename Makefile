.PHONY : apply destroy init plan

init:
	terraform -chdir='./terraform' init

apply:
	terraform -chdir='./terraform' apply -var-file="secrets.tfvars" -auto-approve

destroy:
	terraform -chdir='./terraform' destroy -var-file="secrets.tfvars" -auto-approve

plan:
	terraform -chdir='./terraform' plan -var-file="secrets.tfvars"

######################################################################################

#makefile_path  = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
#current_dir = $(makefile_path:/=)

#airflow:
#	mkdir -p ./logs
#	echo -e "AIRFLOW_UID=$$(id -u)" > .env
#	docker compose up airflow-init
#	docker compose up -d
#echo -e "AIRFLOW_PROJ_DIR=$(current_dir)" >> ./docker/airflow/.env
#docker-compose --env-file='./docker/airflow/.env' --project-directory='./docker/airflow' up airflow-init
#docker-compose --env-file='./docker/airflow/.env' --project-directory='./docker/airflow' up -d

#airflow-down:
#	docker compose down --volumes --rmi all

#kafka-build:
#	cd ./terraform/kafka/resources/docker && ./build.sh

#kafka-push:
#	cd ./terraform/kafka/resources/docker && ./push.sh
