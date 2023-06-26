variable "image_name" {
  type = string
  description = "Docker image name"
}

variable "docker_file_root" {
  type = string
  description = "Root folder where docker file resides for build"
}

variable "container_name" {
  type = string
  description = "Container name"
}

variable "container_internal_port" {
  type = number
  description = "Container internal port"
}


variable "container_external_port" {
  type = number
  description = "Container external port"
}

variable "env" {
  type = list(string)
  default = []
  description = "List of environment variable"
}