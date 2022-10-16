
# k8s tut: https://learn.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-cluster?tabs=azure-cli


resource "azurerm_resource_group" "k8s-ASPNETCore-WebAPI-Sample" {
  name     = "k8s-ASPNETCore-WebAPI-Sample"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "k8s-ASPNETCore-WebAPI-Sample" {
  name                = "example-aks1"
  location            = azurerm_resource_group.k8s-ASPNETCore-WebAPI-Sample.location
  resource_group_name = azurerm_resource_group.k8s-ASPNETCore-WebAPI-Sample.name
  dns_prefix          = "aspnet"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8s-ASPNETCore-WebAPI-Sample.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.k8s-ASPNETCore-WebAPI-Sample.kube_config_raw

  sensitive = true
}
