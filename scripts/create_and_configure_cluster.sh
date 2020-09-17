#!/usr/bin/env/bash

#This creates a kubernetes cluster
sh 	eksctl create cluster \
    --name kubeClusters \
    --version 1.17 \
    --nodegroup-name node-groups \
    --node-type t2.small \
    --nodes 2 \
    --nodes-min 1 \
    --nodes-max 4 \
    --node-ami auto \
    --region us-west-2 \
    --zones us-west-2a \
    --zones us-west-2b \
    --zones us-west-2c \


sh  aws eks --region us-west-2 update-kubeconfig --name kubeClusters

