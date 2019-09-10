# -------------------------------------------
# SAMLAdminRole
# -------------------------------------------
module "SAMLAdminRole" {
  source = "./modules/saml_role"

  name              = "SAMLAdminRole"
  saml_provider_arn = module.Cloudtitlan.arn
  policies          = [module.SAMLAdminAccess.arn]
  policies_count    = 1
}

output "SAMLAdminRole" {
  value = "${module.SAMLAdminRole.arn},${module.Cloudtitlan.arn}"
}

