# terraform hacking

Currently testing what seems like a bug when running the following on the included test module.

```
tf init -backend=false
tf validate
```

The test starts working if the 'terraform_remote_state' in [datasources.tf](terraform/test_module/datasources.tf) is commented out.

Update: It's a known issue: https://github.com/hashicorp/terraform/issues/22163

## travis links

broken on master: [![Build Status](https://travis-ci.com/aerickson/terraform_hacking.svg?branch=master)](https://travis-ci.com/aerickson/terraform_hacking)

working on `make_it_work` branch: [![Build Status](https://travis-ci.com/aerickson/terraform_hacking.svg?branch=make_it_work)](https://travis-ci.com/aerickson/terraform_hacking)
