module "server" {
    source = "./modules/docker-build-and-deploy"
    image_name = "server"
    docker_file_root = "../server"
    container_name = "server_container"
    container_internal_port = 3000
    container_external_port = var.server_port
}

module "client" {
    source = "./modules/docker-build-and-deploy"
    image_name = "client"
    docker_file_root = "../client"
    container_name = "client_container"
    container_internal_port = 3000
    container_external_port = var.client_port
    env = ["REACT_APP_SERVER_URL=http://localhost:${var.server_port}"]
}