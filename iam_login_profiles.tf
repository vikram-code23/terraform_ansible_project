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