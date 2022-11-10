terraform {
  # source = "git::https://github.com/bcgov/startup-sample-project-aws-containers-terraform-modules.git//?ref=v0.0.4"
  source = "git::https://github.com/kdesao-devops/terraform-octk-aws-workload-ecr.git//.?ref=OIDC_integration"
}

include {
  path = find_in_parent_folders()
}

locals {
  environment      = reverse(split("/", get_terragrunt_dir()))[0]
  read_principals  = get_env("AWS_ACCOUNTS_ECR_READ_ACCESS", "")
}


generate "tfvars" {
  path              = "terragrunt.${local.environment}.auto.tfvars"
  if_exists         = "overwrite"
  disable_signature = true
  contents          = <<-EOF
repository_names = ["ssp"]
read_principals = ${local.read_principals}
EOF
}