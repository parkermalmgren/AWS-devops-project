This is a Project to develop and showcase DevOps and AWS skills

Docker:
- Used to containerize the application and its dependencies
- Simplifies deployment and ensures consistent environment across development, testing, and production
- Enables easy scaling and management of multiple containers
- Docker build -t devops-demo .
- Docker run -d -p 8080:8080 devops-demo

FastAPI:
- Simple and easy framework to build and use for projects
- Built on top of Python

Terraform:
- Setup with CLI, IAM user

AWS Account:
- aws sts get-caller-identity

Docker -> ECR
- To login into ECR with Docker
- aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 471112762647.dkr.ecr.us-east-1.amazonaws.com
- 
PUSH COMMANDS:
- When tagging, make sure to include the version number, as i made it immutable
- docker tag devops-demo:latest 471112762647.dkr.ecr.us-east-1.amazonaws.com/parkers-web-app:v1
- docker push 471112762647.dkr.ecr.us-east-1.amazonaws.com/parkers-web-app:vX
- 