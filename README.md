# AWS ECS Fargate Project: Threat Composer Application

## Project Overview:
This project showcases a production grade deployment of a threat composer application to ECS fargate utilising tools such as docker, terraform and github actions for CI/CD pipelines.

This includes:

- Containerised app to ensure it runs consistently across different environments/host systems
- Infrastructure as code using a modular approach to terraform
- Fully automated pipelines for building the docker image, building cloud infrastructure & running a health check
