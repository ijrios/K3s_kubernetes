###### on master node
###############################
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.20.8+k3s1 K3S_TOKEN=mynodetoken sh -s - --no-deploy traefik

# prepare config file distribution
sudo cp --no-preserve=mode /etc/rancher/k3s/k3s.yaml k3s.yaml
