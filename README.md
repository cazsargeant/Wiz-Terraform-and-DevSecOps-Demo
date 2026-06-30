# Wiz Terraform and DevOps Demo

An anonymised public example of my work showing how Wiz Code and the Wiz Terraform Provider can support DevOps workflows across source control, CI/CD pipelines, and Terraform-managed configuration.

This repository is intentionally generic and contains no organisation-specific environment details.

## Demo Story

The demo shows two complementary ways to bring Wiz into an engineering workflow:

- A reusable GitHub Actions workflow runs a Wiz IaC scan against a calling repository before infrastructure changes progress.
- A GCP-oriented Terraform example configures the Wiz Terraform Provider and queries Wiz-managed assets as code.

Together, these examples show how security checks and Wiz environment visibility can be expressed in repeatable DevOps workflows rather than handled manually.

## Repository Structure

```text
.
├── docs/demo-flow.md
├── .github/workflows/scan.yml
└── terraform/wiz-provider-discovery/
    ├── README.md
    ├── main.tf
    ├── outputs.tf
    ├── providers.tf
    ├── terraform.tfvars.example
    ├── variables.tf
    └── versions.tf
```

## Reusable Wiz IaC Scan Workflow

The reusable workflow in `.github/workflows/scan.yml` accepts a repository name from a caller, checks out that repository, installs the Wiz CLI, and runs:

```shell
wiz iac scan --path terraform/
```

### Example Caller Workflow

```yaml
jobs:
  call-wiz-scan:
    uses: cazsargeant/DEMO-Wiz-DevSecOps-Pipeline/.github/workflows/scan.yml@main
    with:
      repo_url: ${{ github.repository }}
    secrets:
      WIZ_API_TOKEN: ${{ secrets.WIZ_API_TOKEN }}
```

The calling repository must define a `WIZ_API_TOKEN` secret before using the workflow.

## Terraform Provider Example

The `terraform/wiz-provider-discovery` example shows how to configure the Wiz Terraform Provider and query existing Wiz-managed assets, using GCP-oriented defaults:

- cloud accounts
- container registries such as Google Artifact Registry or Google Container Registry
- Kubernetes clusters such as GKE
- Kubernetes namespaces

Credentials are supplied with environment variables, so no secrets are stored in the repository:

```shell
export WIZ_CLIENT_ID="<your-client-id>"
export WIZ_CLIENT_SECRET="<your-client-secret>"
```

Run the example from the Terraform directory:

```shell
cd terraform/wiz-provider-discovery
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
```

The Terraform example is read-only. It demonstrates provider configuration and discovery patterns rather than deploying cloud-side connector infrastructure.

## Demo Flow

See `docs/demo-flow.md` for the end-to-end walkthrough.

## Public Demo Notes

- No production credentials or private configuration are included.
- Example values are placeholders and should be replaced before running against a real Wiz tenant.
- This is an example of my work, not a reusable product template.
