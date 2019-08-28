# terraform hacking

Currently testing what seems like a bug when running the following on the included test module.

```
tf init -backend=false
tf validate
```

The code starts working if datasources.tf:base is commented out.
