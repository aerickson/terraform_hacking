#!/usr/bin/env bash

set -e
set -x

cd terraform/test_module
terraform init -backend=false
terraform validate

echo "success"
