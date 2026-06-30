# Wiz Terraform Provider Discovery Example

This example shows how Terraform can connect to Wiz and query existing GCP-oriented Wiz-managed assets without storing credentials in code.

It uses the Wiz Terraform Provider to read:

- cloud accounts with `wiz_cloud_accounts`
- Google Artifact Registry or Google Container Registry entries with `wiz_container_registries`
- GKE clusters with `wiz_kubernetes_clusters`
- Kubernetes namespaces with `wiz_kubernetes_namespaces`

## Permissions

Create a Wiz service account for Terraform with only the permissions required for the data sources you enable:

- `read:cloud_accounts` for `wiz_cloud_accounts`
- `read:registries` for `wiz_container_registries`
- `read:kubernetes_clusters` for `wiz_kubernetes_clusters`
- `read:resources` for `wiz_kubernetes_namespaces`

## Credentials

Export credentials as environment variables before running Terraform:

```shell
export WIZ_CLIENT_ID="<your-client-id>"
export WIZ_CLIENT_SECRET="<your-client-secret>"
```

Use `WIZ_ENVIRONMENT` or the `wiz_environment` variable when targeting a non-production Wiz tenant:

```shell
export WIZ_ENVIRONMENT="prod"
```

## Run

```shell
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
```

The example values are placeholders. Replace them with search terms that match GCP assets in the target Wiz tenant.
