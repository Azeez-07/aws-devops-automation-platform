
# 1. IAM role trusted by EC2
resource "aws_iam_role" "app_ec2_role" {
  name = "app-ec2-ecr-pull-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"

        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# 2. Allow the application server to pull images from ECR
resource "aws_iam_role_policy" "app_ecr_pull" {
  name = "app-ecr-pull-policy"
  role = aws_iam_role.app_ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "ECRAuthorization"
        Effect = "Allow"

        Action = [
          "ecr:GetAuthorizationToken"
        ]

        Resource = "*"
      },
      {
        Sid    = "PullImagesFromECR"
        Effect = "Allow"

        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]

        Resource = "arn:aws:ecr:us-east-1:344872153789:repository/devops-automation"
      }
    ]
  })
}

# 3. Instance profile used to attach the role to EC2
resource "aws_iam_instance_profile" "app_server_profile" {
  name = "app-server-ecr-profile"
  role = aws_iam_role.app_ec2_role.name
}
