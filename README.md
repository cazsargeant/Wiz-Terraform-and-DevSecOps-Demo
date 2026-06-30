# Wiz Terraform and DevOps Demo

An anonymised public example of my work showing how Wiz Code and the Wiz Terraform Provider can support DevOps workflows across source control, CI/CD pipelines, and Terraform-managed configuration.

This repository is intentionally generic and contains no organisation-specific environment details.

## What This Demonstrates

- A reusable GitHub Actions workflow for running a Wiz IaC scan.
- How an IaC repository can call a shared security workflow using `workflow_call`.
- How Terraform can connect to Wiz using the Wiz Terraform Provider and query existing cloud, registry, and Kubernetes assets.
- How security signals can be surfaced during pull request and pipeline review.

## How The Workflow Works

- A calling repository passes its GitHub repository name through `repo_url`.
- The workflow checks out that repository.
- The workflow installs the Wiz CLI.
- The workflow runs `wiz iac scan --path terraform/`.

## Example Caller Workflow

```yaml
jobs:
  call-wiz-scan:
    uses: cazsargeant/DEMO-Wiz-DevSecOps-Pipeline/.github/workflows/scan.yml@main
    with:
      repo_url: ${{ github.repository }}
```

## Terraform Provider Example

The `terraform/wiz-provider-discovery` example shows how to configure the Wiz Terraform Provider and query:

- cloud accounts
- container registries
- Kubernetes clusters
- Kubernetes namespaces

It uses `WIZ_CLIENT_ID` and `WIZ_CLIENT_SECRET` environment variables, so no credentials are stored in the repository.

## Public Demo Notes

- No production credentials or private configuration are included.
- The workflow expects a repository secret named `WIZ_API_TOKEN` to be configured before use.
- This is an example of my work, not a reusable product template.
