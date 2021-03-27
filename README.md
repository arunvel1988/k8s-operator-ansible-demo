# k8s-operator-ansible-demo

Steps to Install Ansible Operator


1) Clone this repository

git clone https://github.com/arunvel1988/k8s-operator-ansible-demo


2)  cd k8s-operator-ansible-demo/demo

3) kubectl create -f deploy/rbac.yaml

4) kubectl create -f deploy/crd.yaml

5) kubectl create -f deploy/operator.yaml

6) kubectl create -f deploy/cr.yaml




