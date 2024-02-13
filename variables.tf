variable "project_name" {
  type = string
  description = "Project's name"
}

variable "project_owner" {
  type = string
  description = "Project's owner"
}

variable "environment" {
  type = string
  description = "Target env"
}

variable "must_be_created" {
  type = bool
}