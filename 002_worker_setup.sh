###### on worker node
###############################
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.20.8+k3s1 K3S_URL=https://192.168.1.61:6443 K3S_TOKEN=mynodetoken sh -
