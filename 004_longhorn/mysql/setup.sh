helm repo add bitnami https://charts.bitnami.com/bitnami

helm upgrade -i mysql \
  --set auth.rootPassword=secretpassword,auth.database=demodb \
  --set auth.replicationPassword=secretpassword \
  --set architecture=replication \
  --set primary.persistence.size=1Gi \
  --set secondary.persistence.size=1Gi \
  --set secondary.replicaCount=2 \
    bitnami/mysql

# Test
# kubectl run mysql-client --rm --tty -i --restart='Never' --image  docker.io/bitnami/mysql:8.0.25-debian-10-r35 --namespace default --command -- bash
# mysql -h mysql-primary.default.svc.cluster.local -uroot -p demodb
# mysql -h mysql-secondary.default.svc.cluster.local -uroot -p demodb
# Sample table
# CREATE TABLE Books(Id INTEGER PRIMARY KEY, Title VARCHAR(100), Author VARCHAR(60));
# INSERT INTO Books(Id, Title, Author) VALUES(1, 'War and Peace','Leo Tolstoy');
# SELECT * FROM Books;