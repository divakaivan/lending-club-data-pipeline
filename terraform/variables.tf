locals {
  credentials = "./keys/my-creds.json"
}

variable "region" {
  description = "Region"
  default     = "asia-northeast3-a"
}

variable "project" {
  description = "Project"
  default     = "dataengcamp-427114"
}

variable "location" {
    description = "Project Location"
    default = "US"
}

variable "bq_dataset_name" {
    description = "My BigQuery Dataset Name"
    default = "lending_club_bq"
}

variable "gcs_bucket_name" {
    description = "My Storage Bucket Name"
    default = "lending_club_gcs"
}

variable "gcs_storage_class" {
    description = "Bucket Storage Class"
    default = "STANDARD"
}