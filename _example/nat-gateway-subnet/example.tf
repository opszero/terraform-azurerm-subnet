provider "azurerm" {
  features {}
}

module "subnet" {
  source = "../.."

  name        = "app"
  environment = "test"

  resource_group_name  = ""
  location             = ""
  virtual_network_name = ""

  #subnet
  create_nat_gateway = true
  subnet_names       = ["subnet1", "subnet2"]
  subnet_prefixes    = ["10.0.1.0/24", "10.0.2.0/24"]

  # route_table
  enable_route_table = true
  route_table_name   = "nat_gateway"
  routes = [
    {
      name           = "rt-test"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]
}
