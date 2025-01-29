# Azure Linux Web App Terraform Module

Terraform module to create a Linux Web App along with a deployment slot and management lock.

# Table of Contents

- [Azure Resource Naming Convention](#azure-resource-naming-convention)
    - [Format](#Format)
    - [Components](#Components)
- [lifecycle-block](#lifecycle-block)
- [ip_restriction-block](#ip_restriction-block)
- [App Settings](#app-settings)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Azure Resource Naming Convention

Resource names should clearly indicate their type, workload, environment, and region. Using a consistent naming convention ensures clarity, uniformity, and easy identification across all repositories.

#### Format

```
<resource_prefix>-<app_or_project>-<environment>-<region>-<optional_unique_suffix>
```

#### Components

| **Component**           | **Description**                                                                      | **Example**             |
|--------------------------|--------------------------------------------------------------------------------------|-------------------------|
| `resource_prefix`        | Short abbreviation for the resource type.                                           | `rg` (Resource Group)   |
| `app_or_project`         | Identifier for the application or project.                                          | `qoh`           |
| `environment`            | Environment where the resource is deployed (`prod`, `dev`, `test`, etc.).           | `prod`                 |
| `region`                 | Azure region where the resource resides (e.g., `cus` for `centralus`).              | `cus`                  |
| `optional_unique_suffix` | Optional unique string for ensuring name uniqueness, often random or incremental.    | `abcd`, `a42n`                 |

## lifecycle-block

- To add the lifecycle block to your configuration, use the following code:

```hcl
site_config[0].application_stack
```

## ip_restriction-block

```hcl
ip_restriction = {
    AzureFrontDoor = {
        name        = "AzureFrontDoor"
        action      = "Allow"
        service_tag = "AzureFrontDoor.Backend"
        headers = {
            x_azure_fdid = ["XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"]
        }
    },
    Onpremproxy = {
        name       = "Onpremproxy"
        action     = "Allow"
        ip_address = "XXX.XXX.XX.XX/XX"
    }
}
```

## App Settings

- Attempts to import these values will fail.

```hcl
WEBSITE_HEALTHCHECK_MAXPINGFAILURES        = "5"
WEBSITE_HTTPLOGGING_RETENTION_DAYS         = "5"
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_web_app.linux_web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot.linux_web_app_staging_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
| [azurerm_management_lock.management_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | (Optional) A map of key-value pairs for App Settings and custom values. | `any` | `{}` | no |
| <a name="input_auth_settings"></a> [auth\_settings](#input\_auth\_settings) | (Optional) A auth\_settings block. | `any` | `{}` | no |
| <a name="input_auth_settings_v2"></a> [auth\_settings\_v2](#input\_auth\_settings\_v2) | (Optional) A auth\_settings\_v2 block. | `any` | `{}` | no |
| <a name="input_backup"></a> [backup](#input\_backup) | (Optional) A backup block. | `any` | `{}` | no |
| <a name="input_client_affinity_enabled"></a> [client\_affinity\_enabled](#input\_client\_affinity\_enabled) | (Optional) Should Client Affinity be enabled? | `bool` | `null` | no |
| <a name="input_client_certificate_enabled"></a> [client\_certificate\_enabled](#input\_client\_certificate\_enabled) | (Optional) Should Client Certificates be enabled? | `bool` | `null` | no |
| <a name="input_client_certificate_exclusion_paths"></a> [client\_certificate\_exclusion\_paths](#input\_client\_certificate\_exclusion\_paths) | (Optional) Paths to exclude when using client certificates, separated by ; | `any` | `null` | no |
| <a name="input_client_certificate_mode"></a> [client\_certificate\_mode](#input\_client\_certificate\_mode) | (Optional) The Client Certificate mode. Possible values are Required, Optional, and OptionalInteractiveUser. This property has no effect when client\_certificate\_enabled is false. Defaults to Required. | `string` | `"Required"` | no |
| <a name="input_connection_string"></a> [connection\_string](#input\_connection\_string) | (Optional) One or more connection\_string blocks. | `any` | `{}` | no |
| <a name="input_enable_management_lock"></a> [enable\_management\_lock](#input\_enable\_management\_lock) | (Optional) Should the Linux Web App Management Lock be enabled? Defaults to false | `bool` | `false` | no |
| <a name="input_enable_staging_slot"></a> [enable\_staging\_slot](#input\_enable\_staging\_slot) | (Optional) Should the Linux Web App Staging Slot be enabled? Defaults to false | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (Optional) Should the Linux Web App be enabled? Defaults to true | `bool` | `true` | no |
| <a name="input_ftp_publish_basic_authentication_enabled"></a> [ftp\_publish\_basic\_authentication\_enabled](#input\_ftp\_publish\_basic\_authentication\_enabled) | (Optional) Should the default FTP Basic Authentication publishing profile be enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | (Optional) Should the Linux Web App require HTTPS connections. Defaults to false. | `bool` | `false` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity block | `any` | `{}` | no |
| <a name="input_key_vault_reference_identity_id"></a> [key\_vault\_reference\_identity\_id](#input\_key\_vault\_reference\_identity\_id) | (Optional) The User Assigned Identity ID used for accessing KeyVault secrets. The identity must be assigned to the application in the identity block. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure Region where the Linux Web App should exist. Changing this forces a new Linux Web App to be created. | `string` | n/a | yes |
| <a name="input_logs"></a> [logs](#input\_logs) | (Optional) A logs block. | `any` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name which should be used for this Linux Web App. Changing this forces a new Linux Web App to be created. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Should public network access be enabled for the Web App. Defaults to true. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the Resource Group where the Linux Web App should exist. Changing this forces a new Linux Web App to be created. | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | (Required) The ID of the Service Plan that this Linux App Service will be created in. | `string` | n/a | yes |
| <a name="input_site_config"></a> [site\_config](#input\_site\_config) | (Required) A site\_config block. | `any` | n/a | yes |
| <a name="input_slot_app_settings"></a> [slot\_app\_settings](#input\_slot\_app\_settings) | (Optional) A map of key-value pairs for App Settings and custom values. | `any` | `{}` | no |
| <a name="input_slot_https_only"></a> [slot\_https\_only](#input\_slot\_https\_only) | (Optional) Should the Linux Web App Staging Slot require HTTPS connections. Defaults to false. | `bool` | `false` | no |
| <a name="input_staging_slot_service_plan_id"></a> [staging\_slot\_service\_plan\_id](#input\_staging\_slot\_service\_plan\_id) | (Optional) The ID of the Service Plan in which to run this slot. If not specified the same Service Plan as the Linux Web App will be used. | `string` | `null` | no |
| <a name="input_sticky_settings"></a> [sticky\_settings](#input\_sticky\_settings) | (Optional) A sticky\_settings block. | `any` | `{}` | no |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | (Optional) One or more storage\_account blocks. | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_virtual_network_subnet_id"></a> [virtual\_network\_subnet\_id](#input\_virtual\_network\_subnet\_id) | (Optional) The subnet id which will be used by this Web App for regional virtual network integration. | `string` | `null` | no |
| <a name="input_webdeploy_publish_basic_authentication_enabled"></a> [webdeploy\_publish\_basic\_authentication\_enabled](#input\_webdeploy\_publish\_basic\_authentication\_enabled) | (Optional) Should the default WebDeploy Basic Authentication publishing credentials enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_zip_deploy_file"></a> [zip\_deploy\_file](#input\_zip\_deploy\_file) | (Optional) The local path and filename of the Zip packaged application to deploy to this Linux Web App. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_domain_verification_id"></a> [custom\_domain\_verification\_id](#output\_custom\_domain\_verification\_id) | The identifier used by App Service to perform domain ownership verification via DNS TXT record. |
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | The default hostname of the Linux Web App. |
| <a name="output_hosting_environment_id"></a> [hosting\_environment\_id](#output\_hosting\_environment\_id) | The ID of the App Service Environment used by App Service. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Linux Web App. |
| <a name="output_identity"></a> [identity](#output\_identity) | An identity block |
| <a name="output_kind"></a> [kind](#output\_kind) | The Kind value for this Linux Web App. |
| <a name="output_name"></a> [name](#output\_name) | The Name of the Linux Web App. |
| <a name="output_outbound_ip_address_list"></a> [outbound\_ip\_address\_list](#output\_outbound\_ip\_address\_list) | A list of outbound IP addresses - such as ['52.23.25.3', '52.143.43.12'] |
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12. |
| <a name="output_possible_outbound_ip_address_list"></a> [possible\_outbound\_ip\_address\_list](#output\_possible\_outbound\_ip\_address\_list) | A list of possible outbound ip address. |
| <a name="output_possible_outbound_ip_addresses"></a> [possible\_outbound\_ip\_addresses](#output\_possible\_outbound\_ip\_addresses) | A comma-separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12,52.143.43.17 - not all of which are necessarily in use. Superset of outbound\_ip\_addresses. |
| <a name="output_site_credential"></a> [site\_credential](#output\_site\_credential) | A site\_credential block as defined below. |
