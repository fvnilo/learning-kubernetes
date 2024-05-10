# learning-kubernetes

> A little lab to (re-)learn Kubernetes

This codebase is a mix between the [example-voting-app by kodecloud](https://github.com/kodekloudhub/example-voting-app-kubernetes/) and the one provided by [dockersamples](https://github.com/dockersamples/example-voting-app/). The applicative code are shameless copy-pastes from the other repositories.

It was mostly an exercise to get back into Kubernetes.

## Pre-requisites

- [Docker](https://www.docker.com/get-started/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
- [minikube](https://minikube.sigs.k8s.io/docs/start/)

## Getting Started

There is a `Makefile` in this repository that is meant to make deployment and teardown easy as possible.

### Build and Deploy App

```sh
make up
```

#### Use the App

You can monitor if the app is up by running `kubectl get pod`. You should see 5 pods: `postgres`, `redis`, `result`, `vote` and `worker` and all the pods should have the status `Running`.

When everything is running, in two **separate** terminals, run `minikube service result-service --url` and `minikube service vote-service --url`. 
These two commands will output URLs you can use to interact with the two client-facing applications to vote.

### Tear down

```sh
make down
```

Then wait for pods to terminate properly by running `kubectl get pods`. Once there are no pods left, run `make delete-images`.
