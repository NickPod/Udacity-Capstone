# Udacity DevOps Nanodegree Capstone Project
This project is the culmination of Udacity's Cloud DevOps Engineer Nanodegree Program. The goal is to be able to create a pipeline to deploy an application to a kubernetes cluster we've created. In this project I will deploy a simple webpage served via nginx.

## Repository
For this project I have created a repository within Amazon's Elastic Container Registry (ECR) to hold container images.

## Creating the Cluster
To create the cluster in AWS I used the following command:
'eksctl create cluster --name capstonecluster --version 1.17 --nodegroup-name standard-workers --node-type t2.micro --nodes 3 --nodes-min 1 --nodes-max 5 --node-ami auto --region us-east-1 --zones us-east-1a --zones us-east-1b --zones us-east-1c --zones us-east-1d'

