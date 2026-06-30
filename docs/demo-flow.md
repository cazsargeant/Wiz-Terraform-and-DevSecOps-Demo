# Demo Flow

This walkthrough shows how the repository fits together as a DevOps example.

## 1. Calling Repository Starts A Pipeline

An infrastructure repository calls the reusable workflow in this repository:

```yaml
jobs:
  call-wiz-scan:
    uses: cazsargeant/DEMO-Wiz-DevSecOps-Pipeline/.github/workflows/scan.yml@main
    with:
      repo_url: ${{ github.repository }}
    secrets:
      WIZ_API_TOKEN: ${{ secrets.WIZ_API_TOKEN }}
```

The caller controls when the workflow runs. Typical triggers would be pull requests or pushes that change Terraform files.

## 2. Reusable Workflow Runs Wiz IaC Scan

The reusable workflow:

1. Checks out the calling repository.
2. Installs the Wiz CLI.
3. Runs `wiz iac scan --path terraform/`.

This keeps the scan logic in one place and lets other repositories consume the same pattern.

## 3. Terraform Queries Wiz As Code

The Terraform example in `terraform/wiz-provider-discovery` configures the Wiz Terraform Provider and queries GCP-oriented Wiz-managed assets:

- cloud accounts
- Google Artifact Registry or Google Container Registry entries
- GKE clusters
- Kubernetes namespaces

This demonstrates how Wiz environment visibility can be expressed as Terraform configuration and reviewed like other infrastructure code.

## 4. Credentials Stay Outside The Repository

The examples expect credentials to be supplied through environment variables or GitHub secrets:

- `WIZ_API_TOKEN` for the GitHub Actions workflow
- `WIZ_CLIENT_ID` and `WIZ_CLIENT_SECRET` for the Terraform provider

No real account IDs, tenant names, or credential values are included.

## What This Proves

The demo shows how to make Wiz checks repeatable across DevOps workflows:

- CI/CD can call a shared Wiz IaC scan.
- Terraform can query Wiz-managed assets without embedding secrets.
- Security checks become part of the engineering workflow instead of a separate manual step.
