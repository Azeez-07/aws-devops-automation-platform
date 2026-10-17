
# AWS DevOps Automation Platform

An end-to-end DevOps project that automates infrastructure provisioning, CI validation, Docker image publishing, and application deployment using AWS and Jenkins.

## Tech Stack
- AWS EC2, IAM, VPC, Security Groups, Amazon ECR
- Terraform
- Jenkins CI/CD
- Docker and Nginx
- Git and GitHub
- Bash scripting

## Workflow
1. Push application changes to GitHub.
2. Jenkins CI validates the files and builds a Docker image.
3. The image is pushed to Amazon ECR using the Jenkins EC2 IAM role.
4. The CD pipeline connects to the application EC2 server.
5. The application server pulls the image using its IAM role and runs the Nginx container.
6. A health check verifies that the application responds successfully.

## Repository Structure
- `app/` — Application HTML
- `docker/` — Dockerfile
- `scripts/` — Validation and deployment scripts
- `terraform/` — Infrastructure configuration
- `Jenkinsfile.ci` — Continuous integration pipeline
- `Jenkinsfile.cd` — Continuous deployment pipeline

## Author
Mohammed Abdul Azeez
