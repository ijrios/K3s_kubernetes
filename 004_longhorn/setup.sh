# Prerequisite
# run this command as root on every nodes
# sudo apt-get install open-iscsi

helm repo add longhorn https://charts.longhorn.io
helm repo update

kubectl create namespace longhorn-system
helm upgrade -i longhorn longhorn/longhorn --namespace longhorn-system

# remove k3s local-path default storage class
# login to masternode and run this command
# sudo cp /var/lib/rancher/k3s/server/manifests/local-storage.yaml /var/lib/rancher/k3s/server/manifests/custom-local-storage.yaml
# sudo sed -i -e "s/storageclass.kubernetes.io\/is-default-class: \"true\"/storageclass.kubernetes.io\/is-default-class: \"false\"/g" /var/lib/rancher/k3s/server/manifests/custom-local-storage.yaml