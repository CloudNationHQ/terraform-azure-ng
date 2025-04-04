module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.22"

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
  version = "~> 8.0"

  naming = local.naming

  vnet = {
    name           = module.naming.virtual_network.name
    location       = module.rg.groups.demo.location
    resource_group = module.rg.groups.demo.name
    address_space  = ["10.0.0.0/16"]
    dns_servers    = ["8.8.8.8", "7.7.7.7"]

    subnets = {
      sn1 = {
        address_prefixes = ["10.0.1.0/24"]
      }
    }
  }
}

module "public_ip" {
  source  = "cloudnationhq/pip/azure"
  version = "~> 3.0"

  configs = {
    pub1 = {
      name           = "${module.naming.public_ip.name}1"
      location       = module.rg.groups.demo.location
      resource_group = module.rg.groups.demo.name
      zones          = ["1", "2", "3"]
    }

    pub2 = {
      name           = "${module.naming.public_ip.name}2"
      location       = module.rg.groups.demo.location
      resource_group = module.rg.groups.demo.name
      zones          = ["1", "2", "3"]
    }
  }
}

module "natgw" {
  source  = "cloudnationhq/ng/azure"
  version = "~> 1.0"

  config = {
    name           = module.naming.nat_gateway.name
    location       = module.rg.groups.demo.location
    resource_group = module.rg.groups.demo.name
    subnet_id      = module.network.subnets.sn1.id
    zones          = ["1"]

    public_ip_associations = {
      pub1 = {
        public_ip_address_id = module.public_ip.configs.pub1.id
      }
      pub2 = {
        public_ip_address_id = module.public_ip.configs.pub2.id
      }
    }
  }
}
