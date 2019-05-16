workflow "New workflow" {
  on = "push"
  resolves = ["Docker Login"]
}

action "build docker image" {
  uses = "actions/docker/cli@master"
  runs = "docker build -t debianmaster/locust ."
}

action "Docker Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}
