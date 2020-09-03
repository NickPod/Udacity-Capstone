# Udacity DevOps Nanodegree Capstone Project
This project is the culmination of Udacity's Cloud DevOps Engineer Nanodegree Program. The goal is to be able to create a pipeline to deploy an application to a kubernetes cluster we've created. In this project I will deploy a simple webpage served via nginx with pods being updated in a rolling deployment pattern.

# Setting up the environment
## Repository
For this project I have created a repository within Amazon's Elastic Container Registry (ECR) to hold container images. Images for this project will be stored at `884552403086.dkr.ecr.us-east-1.amazonaws.com/udacity/udacity-capstone:latest`

## Creating the Cluster
To create the cluster in AWS I used the following command:
`eksctl create cluster --name capstonecluster --version 1.17 --nodegroup-name standard-workers --node-type t2.micro --nodes 3 --nodes-min 1 --nodes-max 5 --node-ami auto --region us-east-1 --zones us-east-1a --zones us-east-1b --zones us-east-1c --zones us-east-1d`

# The Pipeline
The pipeline runs through 4 steps to deploy updated images into the cluster.
1. Linting - The Dockerfile is linted using the hadolint lint. Hadolint is available [here](https://github.com/hadolint/hadolint).
2. Build Container Image - The Dockerfile is used to build the container image for the site's web servers. The base image is `nginx:stable-alpine`. Currently only index.html is added to the image, but that can be expanded upon.
3. Push Image to ECR - Using AWS credentials configured within Jenkins, the pipeline fetches credentials to the repository and pushes the newly built image as `udacity/udacity-capstone:latest`.
4. Deploy Image to EKS - Using a rolling deployment, the image is pushed to your cluster.

# Key Files
`
1. Jenkinsfile - Defines the pipeline Jenkins will use for this project
2. Dockerfile - Defines how the container image is built.
3. index.html - HTML file to be served by the container
4. deploy.yml - YAML file defining the kubernetes deployment of the project. Deploys both the pods containing the web servers as well as the load balancer service they sit behind.
5. run_docker.sh - A shell script useful to create the docker image locally during development.
`