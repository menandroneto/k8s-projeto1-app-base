#!/bin/bash

echo "building images..."

docker build -t menandroneto/kube-backend:1.0 backend/.
docker build -t menandroneto/kube-bd:1.0 database/.

echo "pushing images..."

docker push menandroneto/kube-backend:1.0
docker push menandroneto/kube-bd:1.0

echo "creating services on cluster kb8..."

kubectl apply -f ./services.yml

echo "deployments..."

kubectl apply -f ./deployment.yml
