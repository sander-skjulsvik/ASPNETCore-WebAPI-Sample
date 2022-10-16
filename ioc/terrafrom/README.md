

### installing terraform

ref: https://learn.hashicorp.com/tutorials/terraform/install-cli

gpg key pub: E8A0 32E0 94D8 EB4E A189 D270 DA41 8C88 A321 9F7B

```shell
# Making sure system is up to date
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# Installing HashiCorp GPG KEy
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
# Verify the fingerprint
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
# Added HashiCorp key to system
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
# Update
sudo apt update
# Install terraform
sudo apt-get install terraform
```

#### Enable Tab completion

```shell
terraform -install-autocomplete
```

## Variables


Expected from env
```
TF_VAR_az_subscription_id
TF_VAR_az_tenant_id
TF_VAR_az_client_id
TF_VAR_az_client_secret
```

## az setup

```shell
ARM_ACCESS_KEY
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
ARM_CLIENT_ID
ARM_CLIENT_SECRET
```

## Setting up k8s

k8s tut: https://learn.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-cluster?tabs=azure-cli



## Remote state file (not implemented)

https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli

### Config used


```shell
#!/bin/bash


export RESOURCE_GROUP_NAME=tfstate
export STORAGE_ACCOUNT_NAME=tfstate$RANDOM
export CONTAINER_NAME=tfstate
export LOCATION=norwayeast

echo $STORAGE_ACCOUNT_NAME

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
```