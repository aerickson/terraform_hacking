terraform {
  backend "s3" {
    bucket         = "redacted-tf-states"
    key            = "redacted-redacted.tfstate"
    dynamodb_table = "tf_state_lock_redacted-redacted"
    region         = "us-west-2"
  }
}
