module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.32"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 2.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name_unique
      location = "westeurope"
    }
  }
}

module "network" {
  source  = "cloudnationhq/vnet/azure"
  version = "~> 9.0"

  naming = local.naming

  vnet = {
    name                = module.naming.virtual_network.name
    location            = module.rg.groups.demo.location
    resource_group_name = module.rg.groups.demo.name
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["8.8.8.8", "7.7.7.7"]

    subnets = {
      sn1 = {
        address_prefixes = ["10.0.1.0/24"]
      }
    }
  }
}

module "public_ip" {
  source  = "cloudnationhq/pip/azure"
  version = "~> 4.0"

  configs = {
    pub1 = {
      name                = "${module.naming.public_ip.name}1"
      location            = module.rg.groups.demo.location
      resource_group_name = module.rg.groups.demo.name
      sku                 = "StandardV2"
      zones               = ["1", "2", "3"]
    }
  }
}

module "natgw" {
  source  = "cloudnationhq/ng/azure"
  version = "~> 4.0"

  config = {
    name                    = module.naming.nat_gateway.name
    location                = module.rg.groups.demo.location
    resource_group_name     = module.rg.groups.demo.name
    sku_name                = "StandardV2"
    idle_timeout_in_minutes = 4

    associations = {
      subnets = {
        sn1 = {
          subnet_id = module.network.subnets.sn1.id
        }
      }
      public_ips = {
        pub1 = {
          public_ip_address_id = module.public_ip.configs.pub1.id
        }
      }
    }
  }
}
