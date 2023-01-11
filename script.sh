#!/bin/bash

echo "Criando as imagens..."
docker build -t rafaelsdomingos/dio-k8s-backend:1.0 backend/.
docker build -t rafaelsdomingos/dio-k8s-database:1.0 database/.

echo "Subindo as imagens para o Docker Hub"

docker push rafaelsdomingos/dio-k8s-backend:1.0
docker push rafaelsdomingos/dio-k8s-database:1.0


echo "Realizando o deployment no cluster Kubernetes"
kubectl apply -f ./deployment.yml


echo "Criando os serviços no cluster Kubernetes"
kubectl apply -f ./services.yml