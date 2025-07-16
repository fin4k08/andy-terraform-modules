# Static Site Storage Wrapper

This module wraps the core `storage-account` module and preconfigures it for use as a static website host.

## Usage

```hcl
module "static_site" {
  source = "git::https://github.com/your-org/terraform-modules.git//storage-static-site?ref=v1.0.0"

  storage_account_prefix = "somepage"
  resource_group_name    = "rg-web"
  location               = "uksouth"

  tags = {
    project = "hello-world"
    env     = "dev"
  }
}
