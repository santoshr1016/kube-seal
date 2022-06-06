APP=sealapp
REPO=santoshr1016
VERSION=v0.1.2

.PHONY: build push
all: build push

build:
	docker build -t ${REPO}/${APP}:${VERSION} -f ./app/Dockerfile ./app

push:
	docker push ${REPO}/${APP}:${VERSION}

create-eks:
	eksctl create cluster -f eks.yaml

delete-eks:
	eksctl delete cluster -f eks.yaml

run:
	export KEY1=secret123 && export KEY2=secret321 && python3 app/src/server.py

run-container:
	docker run -p 8080:8080 -e KEY1=test123 -e KEY2=test321 ${REPO}/${APP}:${VERSION}