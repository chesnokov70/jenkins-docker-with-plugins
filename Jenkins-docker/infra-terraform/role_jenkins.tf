
# Create IAM role for Jenkins
resource "aws_iam_instance_profile" "jenkins_profile_devops_course" {
  name = "jenkins_profile_devops_course"
  role = aws_iam_role.jenkins_role_devops_course.name
}

resource "aws_iam_role" "jenkins_role_devops_course" {
  name = "jenkins_role_devops_course"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# RBAC - Role Based Access Control | Least Privilege

resource "aws_iam_role_policy" "jenkins_role_devops_course" {
  name = "jenkins_role_devops_course_policy"
  role = aws_iam_role.jenkins_role_devops_course.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "s3:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "iam:PassRole",
          "iam:ListRoles"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}