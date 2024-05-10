up: build deploy

down: delete-result delete-vote delete-worker delete-redis delete-postgres

build: build-vote build-result build-worker

deploy: deploy-postgres deploy-redis deploy-worker deploy-vote deploy-result

delete-images: delete-vote-image delete-result-image delete-worker-image delete-redis-image delete-postgres-image

build-vote:
	cd src/vote; eval $(minikube docker-env); docker build -t fvnilo/vote-app .

deploy-vote:
	kubectl apply -f kubernetes/vote

delete-vote:
	kubectl delete -f kubernetes/vote

delete-vote-image:
	eval $(minikube docker-env); docker rmi fvnilo/vote-app

build-result:
	cd src/result; eval $(minikube docker-env); docker build -t fvnilo/result-app .

deploy-result:
	kubectl apply -f kubernetes/result

delete-result:
	kubectl delete -f kubernetes/result

delete-result-image:
	eval $(minikube docker-env); docker rmi fvnilo/result-app

build-worker:
	cd src/worker; eval $(minikube docker-env); docker build -t fvnilo/worker-app .

deploy-worker:
	kubectl apply -f kubernetes/worker

delete-worker:
	kubectl delete -f kubernetes/worker

delete-worker-image:
	eval $(minikube docker-env); docker rmi fvnilo/worker-app

deploy-redis:
	kubectl apply -f kubernetes/redis

delete-redis:
	kubectl delete -f kubernetes/redis

delete-redis-image:
	eval $(minikube docker-env); docker rmi redis

deploy-postgres:
	kubectl apply -f kubernetes/postgres

delete-postgres:
	kubectl delete -f kubernetes/postgres

delete-postgres-image:
	eval $(minikube docker-env); docker rmi postgres
