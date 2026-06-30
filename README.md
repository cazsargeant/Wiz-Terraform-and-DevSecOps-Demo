# Wiz DevSecOps Pipeline Demo

An anonymised public example of my work showing how Wiz Code can support a DevSecOps workflow across source control and CI/CD pipelines.

This repository is intentionally generic and contains no organisation-specific environment details.

## What This Demonstrates

- A reusable GitHub Actions workflow for running a Wiz IaC scan.
- How an IaC repository can call a shared security workflow using `workflow_call`.
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

## Public Demo Notes

- No production credentials or private configuration are included.
- The workflow expects a repository secret named `WIZ_API_TOKEN` to be configured before use.
- This is an example of my work, not a reusable product template.
