data "aws_route53_zone" "redacted" {
  name = "redacted.redacted.net."
}

// disabling this block makes the tests pass...
data "terraform_remote_state" "base" {
  backend = "s3"

  config = {
    bucket         = "redacted-tf-states"
    key            = "base.tfstate"
    dynamodb_table = "tf_state_lock_base"
    region         = "us-west-2"
  }
}
