variable "ssh_user" {
  description = "Initial user to add to instance."
}

variable "ssh_key" {
  description = "Initial ssh key to add for new instances."
}

variable "host_count" {
  description = "Number of redacted-redacted hosts to create."
  default     = "1"
}
