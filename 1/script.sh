# Setear manualmente las siguientes variables:
GH_USER="carlostaffe"
GH_TOKEN="c8cdac17b02a5fb914f5597c34d623997afb1617"

# Ejecutar
echo ${GH_USER:?} ${GH_TOKEN:?}
#wget https://www.kube.um.edu.ar/kube-um-ca.crt
kubectl config set-cluster --certificate-authority=$PWD/kube-um-ca.crt \
  --server https://api.kube.um.edu.ar:6443 kube-um
kubectl config set-context --cluster=kube-um --user=um-${GH_USER} \
  --namespace=${GH_USER,,} kube-um-${GH_USER}
kubectl config set-credentials um-${GH_USER} --token ${GH_TOKEN}
kubectl config use-context kube-um-${GH_USER}
kubectl config view

# Probar
#kubectl get node
#kubectl get pod
#kubectl get pod --all-namespaces
