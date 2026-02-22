# AWS ECS Fargate Project: Threat Composer Application

## Project Overview:
This project showcases a production grade deployment of a threat composer application to ECS fargate utilising tools such as docker, terraform and github actions for CI/CD pipelines.

This includes:

- Containerised app to ensure it runs consistently across different environments/host systems
- Infrastructure as code using a modular approach to terraform
- Fully automated pipelines for building the docker image, building cloud infrastructure & running a health check

## AWS Architecture:

<img width="816" height="673" alt="image" src="https://github.com/user-attachments/assets/32e500ed-972b-43b7-ad8c-86295afcd0ec" />


This includes:

- Private VPC
- Two availability zones for high availability and resilience against single zone failure
- Public & private subnet for each availability zone
- Internet gateway to allow internet traffic in and out of the VPC
- Application load balancer to distribute incoming traffic to public subnets in both availability zones
- Nat gateway to allow ECS tasks in private subnet to access the internet
- ECS in private subnets with inbound traffic allowed from ALB security groups, allowing ECS task to receive and respond to requests.
- Route 53 as a DNS to provide a domain name
- ACM to provide HTTPS certificate for encrypting traffic for users

## Image of running app & health check


<img width="1918" height="1020" alt="image" src="https://github.com/user-attachments/assets/6ad754e2-2622-4951-be6f-0d505254fcc6" />
<img width="1918" height="672" alt="image" src="https://github.com/user-attachments/assets/b676e5a8-b451-4f93-bc26-33aced948790" />

## Elastic Container Registry:
I used the bootstrapping approach to create the ECR manually via clickops before integrating it into my terraform via infrastructure as code.

<img width="1918" height="577" alt="image" src="https://github.com/user-attachments/assets/f370e8f7-2c7d-43cc-b99a-5f99bdf6477e" />

## AWS Certificate Manager:
ACM provisions and manages SSL/TLS certification for ``tm.abdiyasirthreatcomposer.co.uk``

<img width="1918" height="513" alt="image" src="https://github.com/user-attachments/assets/2c0cebc8-4431-4b46-bef9-50bc9897566f" />



















