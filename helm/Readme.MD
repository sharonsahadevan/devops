## Helm installation from Script

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

## Helm installation using package managers

The Helm community provides the ability to install Helm through operating system package managers. These are not supported by the Helm project and are not considered trusted 3rd parties.


### MacOSX
```
brew install helm
```

### Windows
```
choco install kubernetes-helm
```

### Debian/Ubuntu

```
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```

### FreeBSD

```
pkg install helm
```

### installation using Snap

```
sudo snap install helm --classic
```

## Helm installtion from source

## The installation for golang can be found at :

https://golang.org/doc/install

## The glide project is located at:

https://github.com/Masterminds/glide

## The official helm repo is located at

https://github.com/helm/helm

## Here is a command reference for this lesson:

### Install Go

```
cd gotar
sudo tar -C /usr/local -xzf ./go1.11.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
cd ~
```
### Install Glide, Helm, Tiller

```
curl https://glide.sh/get | sh
export GOPATH=$HOME/go
echo $GOPATH

./glide.sh
cd go/src/k8s.io/
rm -fr helm
git clone https://github.com/helm/helm.git 
cd helm
```
### Build command for Helm:

```
make bootstrap build
```
### Move Helm and Tiller, check version

```
cd bin
sudo mv ./helm /usr/local/bin
sudo mv ./tiller /usr/local/bin

cd ~
helm version
```

### Kubernetes service account:

```
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
```

### Add the stable repo

```
helm repo add stable https://charts.helm.sh/stable
```

### search helm repo

```
helm search repo stable
```

Finally, let’s configure Bash completion for the helm command:

```
helm completion bash >> ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
source <(helm completion bash)

```
