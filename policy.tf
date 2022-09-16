resource "bigip_waf_policy" "this" {
  provider              = var.bigip
  name                  = var.name
  partition		          = var.partition
  template_name         = var.template_name
  application_language  = var.application_language
  enforcement_mode      = var.enforcement_mode
  server_technologies   = var.server_technologies
  parameters            = var.parameters
  urls                  = var.urls
  signatures            = var.signatures
  cves                  = var.cves
  modifications         = var.modifications
}
