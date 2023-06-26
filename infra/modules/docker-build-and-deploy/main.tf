resource "docker_image" "image" {
  name = var.image_name
  build {
    context = var.docker_file_root
  }
}

resource "docker_container" "container" {
  name  = var.container_name
  image = docker_image.image.image_id
  ports {
    internal = var.container_internal_port
    external = var.container_external_port
  }
  env = var.env
}