variable "name" {
  type        = string
  default     = ""
  description = "function name"
}

variable "region" {
  type        = string

  validation {
    condition = contains([
      "australiacentral",
      "australiacentral2",
      "australiaeast",
      "australiasoutheast",
      "brazilsouth",
      "brazilsoutheast",
      "brazilus",
      "canadacentral",
      "canadaeast",
      "centralindia",
      "centralus",
      "centraluseuap",
      "eastasia",
      "eastus",
      "eastus2",
      "eastus2euap",
      "francecentral",
      "francesouth",
      "germanynorth",
      "germanywestcentral",
      "israelcentral",
      "italynorth",
      "japaneast",
      "japanwest",
      "jioindiacentral",
      "jioindiawest",
      "koreacentral",
      "koreasouth",
      "malaysiasouth",
      "mexicocentral",
      "newzealandnorth",
      "northcentralus",
      "northeurope",
      "norwayeast",
      "norwaywest",
      "polandcentral",
      "qatarcentral",
      "southafricanorth",
      "southafricawest",
      "southcentralus",
      "southeastasia",
      "southindia",
      "spaincentral",
      "swedencentral",
      "swedensouth",
      "switzerlandnorth",
      "switzerlandwest",
      "uaecentral",
      "uaenorth",
      "uksouth",
      "ukwest",
      "westcentralus",
      "westeurope",
      "westindia",
      "westus",
      "westus2",
      "westus3",
      "australiaeastfoundational",
      "austriaeast",
      "chilecentral",
      "eastusslv",
      "indonesiacentral",
      "israelnorthwest",
      "malaysiawest",
      "southcentralus2",
      "southeastus",
      "southwestus"
    ], var.region)
    error_message = "La región especificada no es válida. Por favor, elige una región de la lista permitida."
  }
}
