provider "azurerm" {
  features {}
    subscription_id = "a67cb678-0d1b-4bf0-97dc-521062a152cd"
}


data "azurerm_resource_group" "cloud_in_azure_rb" {
  name     = "cloud_in_azure"

}
/*
# VM created by Terraform
resource "azurerm_virtual_machine" "main" {
  name                  = "myVM"
  location              = data.azurerm_resource_group.cloud_in_azure_rb.location
  resource_group_name   = data.azurerm_resource_group.cloud_in_azure_rb.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "azureuser"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  lifecycle{
  ignore_changes= [main]
}

}

# VM NIC created by Terraform
resource "azurerm_network_interface" "main" {
  name                = "my-vm-nic"
  location            = data.azurerm_resource_group.cloud_in_azure_rb.location
  resource_group_name = data.azurerm_resource_group.cloud_in_azure_rb.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.App_subnet_rb.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Fetch existing Subet from portal

data "azurerm_subnet" "App_subnet_rb" {
  name                 = "subnet-Terraform"
  virtual_network_name = "Vnet-Terraform"
  resource_group_name  = "cloud_in_azure"
}

# Fetch existing NSG from portal

data "azurerm_network_security_group" "portal_NSG" {
  name                = "My-Portal-NSG"
  resource_group_name = "cloud_in_azure"
}

# Attach NSG to VM's NIC
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = data.azurerm_network_security_group.portal_NSG.id
}

*/