# IaC Deployment

1. Rename and adjust values in `vars/*.tfvars`
1. Create resources with the following commands

```PowerShell
az login -t [tenant id]
cd [PATH_TO_REPOSITORY]\deploy\iac
terraform init
terraform apply --var-file .\vars\[ENVIRONMENT].tfvars --state=[ENVIRONMENT].tfstate
```
