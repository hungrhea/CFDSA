docker network create mynet

docker volume create db_data

docker run -d --name mydb --network mynet --mount type=volume,src=db_data,dst=/var/lib/mysql stackupiss/northwind-db:v1

docker run -d -p 8080:3000 --name myapp -e DB_HOST=mydb -e DB_USER="root" -e DB_PASSWORD="changeit" --network mynet stackupiss/northwind-app:v1

# docker run -d -p 3306:3306 \
# --mount type=volume,src=myvol,dst=/var/lib/mysql \
# -e MYSQL_ROOT_PASWORD=abc123 \
# mysql:8.4