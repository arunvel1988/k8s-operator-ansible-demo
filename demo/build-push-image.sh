#!/bin/bash
#Shell script to build and push image for operator
#Command to build operator image
echo -n "Enter repository name  "
read repo_name
echo -n "Enter  Operator image name  "
read image_name 

#command to build image
sudo operator-sdk build $repo_name/$image_name

#Command to push operator image
sudo docker push $repo_name/$image_name

#Command of replace image name in operator yaml
sed -i 's/image-name|$repo_name/$image_name|g' ./deploy/operator.yaml 

#command to create role
kubectl  apply -f  ./deploy/rbac.yaml 

#command to create crd
kubectl  apply -f  ./deploy/crd.yaml
 
#command to create operator deployment
kubectl  apply -f  ./deploy/operator.yaml
sleep 50
podstate=`kubectl get pods | grep ansible-operator |  awk '{print $3}'`

if  [ $podstate == "Running" ]
then
	kubectl  create -f  ./deploy/cr.yaml

else
	echo "Wait for Operator Pod to be in Running state"

fi


