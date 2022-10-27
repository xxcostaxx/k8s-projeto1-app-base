
#!/bin/bash


echo "Criando as imagens"

docker build -t reginaldocosta/projeto-backend:1.0 backend/.
docker build -t reginaldocosta/projeto-database:1.0 database/.

echo "Realizando o push das imagens"

docker push reginaldocosta/projeto-backend:1.0
docker push reginaldocosta/projeto-database1.0

echo "Criando Servicos no cluster kubernets"

kubectl apply -f ./services.yml

echo "Criando Deployment"

kubectl apply - ./deployment.yml