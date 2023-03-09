.PHONY : airflow airflow-down build cassandra cassandra-down clean deploy destroy doc run spark spark-down spark-stop

makefile_path  = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
current_dir = $(makefile_path:/=)

airflow:
	mkdir -p ./logs
	echo -e "AIRFLOW_UID=$$(id -u)" > .env
	docker compose up airflow-init
	docker compose up -d
#echo -e "AIRFLOW_PROJ_DIR=$(current_dir)" >> ./docker/airflow/.env
#docker-compose --env-file='./docker/airflow/.env' --project-directory='./docker/airflow' up airflow-init
#docker-compose --env-file='./docker/airflow/.env' --project-directory='./docker/airflow' up -d

airflow-down:
	docker compose down --volumes --rmi all

clean:
	find ./src/dags -name '*.py[co]' -exec rm {} \;
	find ./src/dags -name '__pycache__' -exec rm -rf ||: {}\;
	find ./src/plugins -name '*.py[co]' -exec rm {} \;
	find ./src/plugins -name '__pycache__' -exec rm -rf ||: {}\;

cassandra:
	docker-compose --project-directory='./docker/cassandra' up -d

cassandra-down:
	docker-compose --project-directory='./docker/cassandra' down

spark:
	docker-compose --project-directory='./docker/spark' up --scale spark-worker=3 -d

spark-down:
	docker-compose --project-directory='./docker/spark' down

spark-stop:
	docker-compose --project-directory='./docker/spark' stop spark spark-worker