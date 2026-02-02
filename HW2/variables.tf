variable "credentials" {
  description = "My Credentials"
  default     = ""C:\Users\danie\02-workflow-orchestration\dtc-de-course-485800-6f56c6f108b3.json""
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "C:\Users\danie\AppData\Roaming\gcloud\application_default_credentials.json"
}


variable "project" {
  description = "Project"
  default     = "dtc-de-course-485800"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "US"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  #Update the below to what you want your dataset to be called
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  #Update the below to a unique bucket name
  default     = "terraform-dtc-de-demo"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}