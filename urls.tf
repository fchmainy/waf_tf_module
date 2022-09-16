variable "urls" {
  type                        = map(object({
  name             	          = string
  description                 = string
  type	                      = string
  protocol	                  = string
  method                      = string
  method_overrides            = string
  perform_staging             = boolean
  signature_overrides_disable = list(string)
  }))
}


data "bigip_waf_entity_url" "this" {
  for_each	                  = var.urls
  name			                  = each.value["name"]
  description                 = each.value["description"]
  type			                  = each.value["type"]
  protocol		                = each.value["data_type"]
  method                      = each.value["value_type"]
  method_overrides            = each.value["is_header"]
  perform_staging 	          = each.value["perform_staging"]
  signature_overrides_disable = each.value["signature_overrides_disable"]
}

output "urls" {
  value = [ for k,v in data.bigip_waf_entity_urls.this: v.json ]
  }
