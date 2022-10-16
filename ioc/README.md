## Setting up terraform 

### installing azure cli

```shell
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

### Azure setup

https://learn.hashicorp.com/tutorials/terraform/azure-build

```shell
az login
```

```shell
az account set --subscription "<subscription>"
```

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