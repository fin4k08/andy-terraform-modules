# Azure Storage Account Module

This module created a stroage account with optional features like:

- Random suffix
- Static website supprt
- Configurable replication, tier and access settings

---

## 📥 Inputs

| Name                   | Description                          | Type          | Default      |
|------------------------|--------------------------------------|---------------|--------------|
| `storage_account_prefix` | Base prefix for storage account name | `string`      | n/a          |
| `resource_group_name`  | Name of the resource group           | `string`      | n/a          |
| `location`             | Azure region                         | `string`      | n/a          |
| `account_tier`         | Storage tier                         | `string`      | `"Standard"` |
| `account_replication_type` | Replication type                | `string`      | `"LRS"`      |
| `access_tier`          | Blob access tier (e.g. `Hot`, `Cool`) | `string`     | `"Hot"`      |
| `enable_static_website` | Enable static site support         | `bool`        | `false`      |
| `index_document`       | Index page for static site          | `string`      | `"index.html"` |
| `error_404_document`   | 404 page for static site            | `string`      | `"404.html"` |
| `tags`                 | Tags to apply to the resource       | `map(string)` | `{}`         |

---

## 📤 Outputs

| Name                  | Description |
|-----------------------|-------------|
| `storage_account_name` | Final name of the storage account |
| `primary_web_endpoint` | Endpoint URL (if static site enabled) |


## 🔁 Example Usage

```hcl
module "storage" {
  source                  = "git::https://github.com/my-org/terraform-modules.git//storage-account?ref=v1.0.0"
  storage_account_prefix  = "myapp"
  resource_group_name     = var.resource_group_name
  location                = var.location
  enable_static_website   = true
  tags = {
    project = "hello-world"
    env     = "dev"
  }
}