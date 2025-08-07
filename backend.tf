terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket = "myaws-ashok-buckethcl"
    key    = "uc/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
