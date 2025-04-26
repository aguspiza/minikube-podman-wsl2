#!/bin/env bash

# you need this to be working, check https://github.com/spurin/wsl-cgroupsv2
# cat /mnt/c/Users/[windows_user]/.wslconfig
# [wsl2]
# kernelCommandLine = cgroup_no_v1=all systemd.unified_cgroup_hierarchy=1
podman run -it --rm docker.io/spurin/wsl-cgroupsv2:latest

if [ ! -f  /usr/local/bin/minikube ]; then
  # Download the latest Minikube
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  # Make it executable
  chmod +x ./minikube

  # Move it to your user's executable PATH
  sudo mv ./minikube /usr/local/bin/
fi

if [ ! -f  /usr/local/bin/kubectl ]; then
  # Download the latest Kubectl
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

  # Make it executable
  chmod +x ./kubectl

  # Move it to your user's executable PATH
  sudo mv ./kubectl /usr/local/bin/
fi

#for rootless podman
minikube config set driver podman
minikube config set rootless true
minikube delete

minikube start --driver=podman --container-runtime=containerd

