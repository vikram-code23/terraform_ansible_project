#--------------------------------- IAM USERS ---------------------------------------------------------
# Developer Users
resource "aws_iam_user" "developer_user" {
  name = "developer-user"
}

resource "aws_iam_user" "developer2_user" {
  name = "developer2-user"
}

# DevOps User
resource "aws_iam_user" "devops_user" {
  name = "devops-user"
}

# QA User
resource "aws_iam_user" "qa_user" {
  name = "qa-user"
}

# Founder
resource "aws_iam_user" "founder_user" {
  name = "founder-user"
}

# Intern
resource "aws_iam_user" "intern_user" {
  name = "intern-user"
}


#--------------------------------- GROUPS ----------------------------------------------------------------

resource "aws_iam_group" "developers" {
  name = "Developers"
}

resource "aws_iam_group" "devops" {
  name = "DevOps"
}

resource "aws_iam_group" "qa" {
  name = "QA"
}

resource "aws_iam_group" "management" {
  name = "Management"
}

resource "aws_iam_group" "interns" {
  name = "Interns"
}



#------------------------------- PERMISSIONS -----------------------------------------------------------------

#------- Developers ------------
resource "aws_iam_group_policy_attachment" "developers_readonly" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

#------- DevOps ------------
resource "aws_iam_group_policy_attachment" "devops_poweruser" {
  group      = aws_iam_group.devops.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

#------- QA ------------
resource "aws_iam_group_policy_attachment" "qa_readonly" {
  group      = aws_iam_group.qa.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

#------- Founder ------------
resource "aws_iam_group_policy_attachment" "management_admin" {
  group      = aws_iam_group.management.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#------- Intern ------------
resource "aws_iam_group_policy_attachment" "intern_readonly" {
  group      = aws_iam_group.interns.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

#--------------- ADD USERS TO GROUPS -----------------------------------------------------------------------
#developer group
resource "aws_iam_user_group_membership" "developer_membership" {
  user = aws_iam_user.developer_user.name

  groups = [
    aws_iam_group.developers.name
  ]
}

resource "aws_iam_user_group_membership" "developer2_membership" {
  user = aws_iam_user.developer2_user.name

  groups = [
    aws_iam_group.developers.name
  ]

}


#devops group
resource "aws_iam_user_group_membership" "devops_membership" {
  user = aws_iam_user.devops_user.name

  groups = [
    aws_iam_group.devops.name
  ]

}

#QA group
resource "aws_iam_user_group_membership" "qa_membership" {
  user = aws_iam_user.qa_user.name

  groups = [
    aws_iam_group.qa.name
  ]
}

#Founder group
resource "aws_iam_user_group_membership" "founder_membership" {
  user = aws_iam_user.founder_user.name

  groups = [
    aws_iam_group.management.name
  ]
}

#Intern group
resource "aws_iam_user_group_membership" "intern_membership" {
  user = aws_iam_user.intern_user.name

  groups = [
    aws_iam_group.interns.name
  ]
}

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

resource "aws_iam_user_login_profile" "developer_login" {
  user = aws_iam_user.developer_user.name

  password_reset_required = true
}

resource "aws_iam_user_login_profile" "developer2_login" {
  user = aws_iam_user.developer2_user.name

  password_reset_required = true
}

resource "aws_iam_user_login_profile" "devops_login" {
  user = aws_iam_user.devops_user.name

  password_reset_required = true
}

resource "aws_iam_user_login_profile" "qa_login" {
  user = aws_iam_user.qa_user.name

  password_reset_required = true
}

resource "aws_iam_user_login_profile" "founder_login" {
  user = aws_iam_user.founder_user.name

  password_reset_required = true
}

resource "aws_iam_user_login_profile" "intern_login" {
  user = aws_iam_user.intern_user.name

  password_reset_required = true
}

# ---------------- ACCOUNT PASSWORD POLICY ----------------

resource "aws_iam_account_password_policy" "password_policy" {

  minimum_password_length = 8

  require_lowercase_characters = true
  require_uppercase_characters = true
  require_numbers              = true
  require_symbols              = true

  allow_users_to_change_password = true

  max_password_age = 90

  password_reuse_prevention = 6
}