


resource "azurerm_resource_group" "web-api" {
  name     = var.web_api_name
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "web-api" {
  name                = var.web_api_name
  location            = azurerm_resource_group.web-api.location
  resource_group_name = azurerm_resource_group.web-api.name
  dns_prefix          = var.web_api_name

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry
resource "azurerm_container_registry" "web-api" {
  name                = "sandersregistry"
  admin_enabled       = false
  location            = azurerm_resource_group.web-api.location
  resource_group_name = azurerm_resource_group.web-api.name
  sku                 = "Premium"
}

# resource "azurerm_role_assignment" "k8s-pull" {
#   principal_id                     = azurerm_kubernetes_cluster.web-api.kubelet_identity[0].object_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.web-api.id
#   skip_service_principal_aad_check = true
# }

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.web-api.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.web-api.kube_config_raw

  sensitive = true
}
