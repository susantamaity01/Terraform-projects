resource = {
 rg03 = {
    name = "laptop02"
    location = "westus"
 }
 rg04 = {
    name = "laptop03"
    location = "eastus"
 }
}
storage = {
    st01 = {
      name = "keyboard0090"
      resource_group_name = "laptop02"
      location = "westus"
      account_tier = "Standard"
      account_replication_type = "LRS"
      rg_key = "rg03"
    }
    st02 = {
      name = "keyboard0091"
      resource_group_name = "laptop03"
      location = "eastus"
      account_tier = "Standard"
      account_replication_type = "LRS"
      rg_key = "rg04"
    }
}
vnet01 = {
  v01 = {
    name = "devvnet01"
    resource_group_name = "laptop02"
    location = "westus"
    address_space = ["10.0.0.0/16"]
    rg_key = "rg03"
  }
   v02 = {
    name = "devvnet02"
    resource_group_name = "laptop03"
    location = "westus"
    address_space = ["10.0.0.0/15"]
    rg_key ="rg04"
   }
}
subnet = {
    sub01 = {
        name = "subnet01"
        resource_group_name = "laptop02"
        virtual_network_name = "devvnet01"
        address_prefixes = ["10.0.1.0/25"]
        rg_key = "rg03"
        vnet_key = "v01"
    }
      sub02 = {
        name = "subnet02"
        resource_group_name = "laptop02"
        virtual_network_name = "devvnet01"
        address_prefixes = ["10.0.1.128/25"]
        rg_key = "rg03"
        vnet_key = "v01"

    }
     sub03 = {
        name = "subnet03"
        resource_group_name = "laptop03"
        virtual_network_name = "devvnet02"
        address_prefixes = ["10.0.0.0/20"]
        rg_key = "rg04"
        vnet_key = "v02"
    }
      sub04 = {
        name = "subnet02"
        resource_group_name = "laptop03"
        virtual_network_name = "devvnet02"
        address_prefixes = ["10.0.16.0/20"]
        rg_key = "rg04"
        vnet_key = "v02"
    }
}