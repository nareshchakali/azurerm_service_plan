/*variable "sku_name" {
    type = map(string)
    default = {
      "S1" = "Standard"
      "F1" = "Free"
      "P1" = "Premium"
      "B1" = "Basic"
    }  
}*/

variable "sku_name" {
    description = "The SKU for the plan. Possible values include B1, B2, B3, D1, F1, Free, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P1v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, Y1, EP1, EP2, EP3, WS1, WS2, and WS3."
    type = string
    validation {
      condition = try(contains(["B1", "B2", "B3", "D1", "F1", "Free", "I1", "I2", "I3", "I1v2", "I2v2", "I3v2", "P1v2", "P1v2", "P3v2", "P1v3", "P2v3", "P3v3", "S1", "S2", "S3", "SHARED", "Y1", "EP1", "EP2", "EP3", "WS1", "WS2", "WS3"], var.sku_name), true)
      error_message = "The 'sku_name' value must be valid. Possible values include B1, B2, B3, D1, F1, Free, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P1v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, Y1, EP1, EP2, EP3, WS1, WS2, and WS3."
    }
}

variable "os_type" {
    description = "The O/S type for App Services to be hosted in this plan. Possible values include 'Windows', 'Linux', and 'WindowsContainer'."
    type = string

    validation {
      condition = try(contains(["Windows", "Linux", "WindowsContainer"], var.os_type), true)
      error_message = "The 'os_type' value must be valid. Possible values are 'Windows', 'Linux', and 'WindowsContainer'."
    }
  
}