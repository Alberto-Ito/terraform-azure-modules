# terraform-azure-modules

This repository contains custom Terraform modules for the Azure cloud provider.

## Active modules

| Module | Description |
| --- | --- |
| [`modules/data-factory`](modules/data-factory/README.md) | Deploys Azure Data Factory with managed virtual network integration runtimes, managed private endpoints, and PostgreSQL/ADLS Gen2 linked services. |

Legacy modules are kept under [`legacy-modules`](legacy-modules/) for existing consumers.

## Documentation validation

Run the module documentation validation script before opening a pull request:

```bash
./scripts/validate-module-docs.py
```

The validation checks that each active module under `modules/` has a README file and that every Terraform `variable` and `output` block includes a `description` attribute.
