# IAM Role for EC2

resource "aws_iam_role" "ec2_s3_role" {
  name = "EC2-S3-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

#--------- Attach S3 policy----------------------

resource "aws_iam_role_policy_attachment" "s3_readonly" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

#----------Create Instance Profile---------------------------
#----------EC2 cannot directly use a Role----
#Role -> Instance Profile -> EC2

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2-S3-Profile"
  role = aws_iam_role.ec2_s3_role.name
}

