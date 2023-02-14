.PHONY : airbyte airbyte-down build cassandra cassandra-down clean deploy destroy doc run spark spark-down spark-stop

airbyte:
	docker-compose --project-directory='./airbyte' up -d

airbyte-down:
	docker-compose --project-directory='./airbyte' down

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