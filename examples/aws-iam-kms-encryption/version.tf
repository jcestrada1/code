terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.26"
    }

    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
  }
  required_version = ">= 0.13"

}
