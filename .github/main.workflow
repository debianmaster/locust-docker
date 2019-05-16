workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Docker"]
}

action "build docker image" {
  uses = "actions/docker/cli@master"
  runs = "docker build -t debianmaster/locust ."
}

action "Docker Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Docker Login"]
  runs = "docker push debianmaster/locust"
  secrets = ["DOCKER_PASSWORD", "DOCKER_USERNAME"]
}
