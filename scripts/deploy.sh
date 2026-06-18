#!/bin/bash

terraform init

terraform apply -auto-approve

terraform output public_ip