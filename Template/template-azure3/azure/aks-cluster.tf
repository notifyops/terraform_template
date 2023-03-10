

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}
}


resource "azurerm_resource_group" "resource_gp" {
  name     = var.resource_gp_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = var.cluster_name
  location            = "${azurerm_resource_group.resource_gp.location}"
  resource_group_name = "${azurerm_resource_group.resource_gp.name}"
  dns_prefix          = "${var.cluster_name}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }



  tags = {
    environment = "Demo"
  }
}
