resource "aws_ssm_parameter" "database_username_parameter_store" {
    name = "database_username_parameter"

}

resource "aws_ssm_parameter" "database_password_parameter_store" {
    name = "database_password_parameter"

}