variable "cves" {
  type                        = map(object({
  name                        = string
  description                 = string
  signature_id                = number
  enabled 	                  = bool
  tag                         = string
  type                        = string
  accuracy                    = string
  perform_staging             = boolean
  }))
}


data "bigip_waf_signatures "cves" {
  for_each	                  = var.signatures
  name			                  = each.value["name"]
  description                 = each.value["description"]
  signature_id                = each.value["signature_id"]
  enabled		                  = each.value["enabled"]
  tag                         = each.value["tag"]
  type                        = each.value["type"]
  accuracy        	          = each.value["accuracy"]
  perform_staging             = each.value["perform_staging"]
}

output "cves" {
  value = [ for k,v in data.bigip_waf_signatures.this: v.json ]
  }
