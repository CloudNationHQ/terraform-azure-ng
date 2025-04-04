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
      location = "germanywestcentral"
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

module "prefixes" {
  source  = "cloudnationhq/pip/azure//modules/prefixes"
  version = "~> 3.0"

  resource_group = module.rg.groups.demo.name
  location       = module.rg.groups.demo.location

  configs = {
    prefix1 = {
      name          = "${module.naming.public_ip_prefix.name}1"
      prefix_length = 31
      zones         = ["1", "2", "3"]
    }
    prefix2 = {
      name          = "${module.naming.public_ip_prefix.name}2"
      prefix_length = 31
      zones         = ["1", "2", "3"]
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

    public_ip_prefix_associations = {
      prefix1 = {
        public_ip_prefix_id = module.prefixes.configs.prefix1.id
      }
      prefix2 = {
        public_ip_prefix_id = module.prefixes.configs.prefix2.id
      }
    }
  }
}
