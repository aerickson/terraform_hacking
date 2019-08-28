provider "aws" {
  version             = "~> 2.0"
  allowed_account_ids = [""]
  alias               = "us-west-2"
  region              = "us-west-2"
}

provider "google" {
  version = "~> 2.11"
  project = "xyz"
  region  = "us-west1"
  zone    = "us-west1-b"
}
