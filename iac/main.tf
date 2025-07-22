resource "aws_s3_bucket" "s3_bucket" {
  bucket = "devops-api-bucket-iac-${terraform.workspace}"

  tags = {
    Name = "Devops bucket"
    Iac = true
    Context = "${terraform.workspace}"
  }
}
