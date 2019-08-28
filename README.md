# terraform hacking

Currently testing what seems like a bug when running the following on the included test module.

```
tf init -backend=false
tf validate
```

The code starts working if datasources.tf:base is commented out.

## travis links

broken on master: [![Build Status](https://travis-ci.com/aerickson/terraform_hacking.svg?branch=master)](https://travis-ci.com/aerickson/terraform_hacking)

working on `make_it_work` branch: [![Build Status](https://travis-ci.com/aerickson/terraform_hacking.svg?branch=make_it_work)](https://travis-ci.com/aerickson/terraform_hacking)
