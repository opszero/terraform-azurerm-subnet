provider "azurerm" {
  features {}
}

module "name_specific_subnet" {
  source = "../.."

  name                 = "app"
  environment          = "test"
  resource_group_name  = ""
  location             = ""
  virtual_network_name = ""

  #subnet
  specific_name_subnet  = true
  specific_subnet_names = "SpecificSubnet"
  subnet_prefixes       = ["10.0.1.0/24"]

  # route_table
  enable_route_table = true
  route_table_name   = "name_specific_subnet"
  routes = [
    {
      name           = "rt-test"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]
}
