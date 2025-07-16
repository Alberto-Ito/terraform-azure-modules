#tags (deprecated)
variable "owner" {
  default = "__owner__"
}

variable "business_unit" {
  default = "__business_unit__"

}

variable "project_name" {
  default = "__project_name__"
}

variable "contact_name" {
  default = "__contact_name__"
}

variable "contact_email" {
  default = "__contact_email__"
}

variable "managed_by_vendor" {
  default = "__managed_by_vendor__"
}

variable "cost_center" {
  default = "__cost_center__"
}

variable "requestor" {
  default = "__requestor__"
}

variable "service_class" {
  default = "__service_class__"
}

variable "league" {
  default = "__league__"
}

#general
variable "location" {
}

variable "product_area" {
  type = string
  validation {
    condition = (
      var.product_area != null && length(var.product_area) == 3
      && contains(["nba", "ott"], var.product_area)
    )
    error_message = "Invalid 'product_area'. It must be exactly 3 characters long."
  }
}
variable "environment_map" {
  type = map
  default = {
    production              = "pd"
    performance_testing     = "pt"
    non_production          = "np"
    user_acceptance_testing = "ut"
    quality_assurance       = "qa"
    development_integration = "di"
    development             = "dv"
    sandbox                 = "sb"

  }
}
variable "environment" {
  type = string
  validation {
    condition = (
      var.environment != null
      && contains(["pd", "pt", "np", "ut", "qa", "di", "dv", "sb", "production", "performance_testing", "non_production", "user_acceptance_testing", "quality_assurance", "development_integration", "development", "sandbox"], var.environment)
    )
    error_message = "Invalid 'environment'. It must not be null and be one of: pd, pt, np, ut, qa, di, dv, sb."
  }
}

variable "location_map" {
  type = map // The region names need to match what the azurerm provider is asking for

  default = {
    eastasia           = "ae"
    southeastasia      = "ase"
    brazilsouth        = "brs"
    canadacentral      = "cac"
    canadaeast         = "cae"
    chinaeast          = "ce"
    chinaeast2         = "ce2"
    chinanorth         = "cn"
    chinanorth2        = "cn2"
    northeurope        = "en"
    westeurope         = "ew"
    francecentral      = "fc"
    francesouth        = "fs"
    global             = "gl"
    germanycentral     = "gc"
    germanynorth       = "gn"
    germanynortheast   = "gne"
    germanywestcentral = "gwc"
    centralindia       = "ic"
    southindia         = "is"
    westindia          = "iw"
    japaneast          = "je"
    japanwest          = "jw"
    koreacentral       = "kc"
    koreasouth         = "ks"
    norwayeast         = "ne"
    norwaywest         = "nw"
    australiacentral   = "rc"
    australiacentral2  = "rc2"
    australiaeast      = "re"
    australiasoutheast = "rse"
    southafricanorth   = "san"
    southafricawest    = "saw"
    switzerlandnorth   = "swn"
    switzerlandwest    = "sww"
    uaecentral         = "uac"
    usgovarizona       = "uag"
    uaenorth           = "uan"
    centralus          = "uc"
    usdodcentral       = "ucd"
    eastus             = "ue"
    eastus2            = "ue2"
    usdodeast          = "ued"
    usgoviowa          = "uig"
    uksouth            = "uks"
    ukwest             = "ukw"
    northcentralus     = "unc"
    southcentralus     = "usc"
    usgovtexas         = "utg"
    usgovvirginia      = "uvg"
    westus             = "uw"
    westus2            = "us"
    westcentralus      = "us"
    notapplicable      = ""
    worldwide          = "ww-"
  }
}
variable "generator" {
  type = map(map(number))
  default = {
    "app" = {
      "rg" = 1
    }
  }
  validation {
    condition = (
      var.generator != null
      && length(var.generator) > 0
      && ! contains(
        [for domain, resources in var.generator : (
          domain != null
          && ! contains(
            [for resource_type, resource_count in resources : (
              resource_count != null && resource_count >= 0
          )], false)
      )], false)
    )
    error_message = "Invalid input for 'generator' variable."
  }
}

