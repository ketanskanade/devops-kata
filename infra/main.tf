terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

resource "docker_image" "server" {
  name = "server"
  build {
    context = "../server"
  }
}

resource "docker_container" "server_container" {
  name  = "server_container"
  image = docker_image.server.image_id
  ports {
    internal = "3000"
    external = var.server_port
  }
}


resource "docker_image" "client" {
  name = "client"
  build {
    context = "../client"
  }
}

resource "docker_container" "client_container" {
  name  = "client_container"
  image = docker_image.client.image_id
  ports {
    internal = "3000"
    external = var.client_port
  }
  env = ["REACT_APP_SERVER_URL=http://localhost:${var.server_port}"]
}