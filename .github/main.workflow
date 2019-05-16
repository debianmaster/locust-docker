workflow "New workflow" {
  on = "push"
  resolves = ["build docker image"]
}

action "build docker image" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  runs = "docker build -t debianmaster/locust ."
}
