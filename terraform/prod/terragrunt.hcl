terraform {
  # source = "git::https://github.com/bcgov/startup-sample-project-aws-containers-terraform-modules.git//?ref=v0.0.4"
  source = "git::https://github.com/kdesao-devops/startup-sample-project-aws-containers-terraform-modules.git//.?ref=OIDC_integration"
}

include {
  path = find_in_parent_folders()
}

generate "prod_tfvars" {
  path              = "prod.auto.tfvars"
  if_exists         = "overwrite"
  disable_signature = true
  contents          = <<-EOF
service_names = ["ssp"]

alb_name = "default"
cloudfront = true

cloudfront_origin_domain = "startup-sample-project.${local.project}-prod.lz1.nimbus.cloud.gov.bc.ca"
EOF
}
