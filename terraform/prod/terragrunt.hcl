terraform {
  # source = "git::https://github.com/bcgov/startup-sample-project-aws-containers-terraform-modules.git//?ref=v0.0.4"
  source = "git::https://github.com/kdesao-devops/terraform-octk-aws-workload-ecr.git//.?ref=OIDC_integration"
}

include {
  path = find_in_parent_folders()
}
