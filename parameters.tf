variable "parameters" {
  type                        = map(object({
  name             	          = string
  description                 = string
  type	                      = string
  data_type	                  = string
  value_type                  = string
  is_header                   = boolean
  is_cookie                   = boolean
  mandatory                   = boolean
  perform_staging             = boolean
  sensitive_parameter         = boolean
  signature_overrides_disable = list(string)
  }))
}


data "bigip_waf_entity_parameter" "this" {
  for_each	                  = var.parameters
  name			                  = each.value["name"]
  type			                  = each.value["type"]
  description                 = each.value["description"]
  type			                  = each.value["type"]
  data_type		                = each.value["data_type"]
  value_type                  = each.value["value_type"]
  is_header                   = each.value["is_header"]
  is_cookie                   = each.value["is_cookie"]
  mandatory                   = each.value["mandatory"]
  perform_staging 	          = each.value["perform_staging"]
  sensitive_parameter         = each.value["sensitive_parameter"]
  signature_overrides_disable = each.value["signature_overrides_disable"]
}

output "parameters" {
  value = [ for k,v in data.bigip_waf_entity_parameter.this: v.json ]
  }
