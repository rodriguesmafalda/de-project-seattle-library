terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  credentials = file("/Users/mafalda.rodrigues/.gc/keys/de-zoomcamp-creds.json")
  project     = var.project
  region      = var.region
}


resource "google_storage_bucket" "seattle-library-checkouts-bucket" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "seattle_library_checkouts_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}
