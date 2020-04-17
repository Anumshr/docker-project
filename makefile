setup:	
	python3 -m venv ~/.dockerproj
install:	
	pip install --upgrade pip &&\
	pip install -r requirements.txt
test:	
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynbcd dockerproj
validate-circleci:
	circleci config process .circleci/config.yml
run-circleci-local:
	circleci local execute

lint:	
	hadolint Dockerfile
	pylint --disable=R,C,W1203,W1202 demos/**/**.py

all: install lint test