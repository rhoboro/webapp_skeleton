NAME=webapp_skeleton
TAG=0.1
MARK=""

constraints:
	docker build -t ${NAME}:${TAG} .
	docker run --rm -it -p 5000:5000 ${NAME}:${TAG} pip freeze > constraints.txt

dev:
	docker build -t ${NAME}:${TAG} .
	docker run --rm -it -p 5000:5000 ${NAME}:${TAG}

production:
	docker build  -t ${NAME}:${TAG} .
	docker run --rm -it -p 5000:5000 -e "APP_CONFIG_FILE=/usr/src/app/config/production.py" ${NAME}:${TAG}

test:
	docker build --build-arg DEPENDENCIES=requirements_dev.txt -t ${NAME}:${TAG} .
	docker run --rm -it -p 5000:5000 ${NAME}:${TAG} pytest -v -m ${MARK}
	docker run --rm -it -p 5000:5000 ${NAME}:${TAG} python -m flake8 --max-line-length=100

