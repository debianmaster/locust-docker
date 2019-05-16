workflow "New workflow" {
  resolves = [
    "GitHub Action for Docker",
    "GitHub Action for Docker-1",
  ]
  on = "push"
}

action "build docker image" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  runs = "docker build -t debianmaster/locust ."
}

action "Docker Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = [
    "Docker Login",
    "GitHub Action for Docker-1",
  ]
  secrets = ["DOCKER_PASSWORD", "DOCKER_USERNAME"]
  args = "push debianmaster/locust:latest"
}

action "GitHub Action for Docker-1" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build -t debianmaster/locust:latest ."
}
