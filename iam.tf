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

