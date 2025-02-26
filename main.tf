#Create a hello.txt using terraform 
resource "local_file" "hello" {
  filename = "/home/archiesgurav10/terraform-practice/hello.txt"
  content  = "This is file created using Terraform"
}


#Configuring the terraform to use docker 
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

#mentioning the provider docker to create image and container using terraform 
provider "docker" {

}


#Creating nginx image in terraform 
resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

#Creating the docker container of image in terraform
resource "docker_container" "nginx_container" {
  name = "nginx-cont"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 80
  }
} 
