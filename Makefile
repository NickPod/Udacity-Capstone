## Makefile allowing for setup of environment and linting files
# Create virtual environment
# Source virtual environment
# Lint dockerfile


setup:
	# Create python virtual environment for project
	python3 -m venv ~/.capstone

source:
	# Source virtualenv
	. ~/.capstone/bin/activate

install:
	# Run from inside virtualenv, installs dependencies
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	# Lint the dockerfile
	hadolint Dockerfile

all: install lint