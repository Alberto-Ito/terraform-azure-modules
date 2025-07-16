variable "application" {
  description = "Application name for association with service, resource, or workload."
  type        = string
  validation {
    condition = (
      contains([
        "Cyber",
        "MKLive",
        "MKVoD",
        "MKCMS",
        "NBAOne",
        "IT",
        "OTT",
        "Shared Services",
      ], var.application)
    )
    error_message = "Invalid 'application' value. It must not be null and be one of: 'MKLive, MKVoD', 'MKCMS', 'OTT', 'IT', 'Shared Services', 'Cyber', 'NBAOne'."
  }
}

variable "data_classification" {
  description = "As defined in the Cybersecurity Policy document, all NBA Information Assets must be assigned by its owner, a classification of Protected, Confidential, Internal Use, or Public."
  type        = string
  validation {
    condition = (
      contains([
        "Public",
        "Internal",
        "Confidential",
        "Protected"
      ], var.data_classification)
    )
    error_message = "Invalid 'data_classification' value. It must not be null and be one of: 'Public, Internal, Confidential, Protected'."
  }
}

variable "department" {
  description = "Department budget roll-up."
  type        = string
  validation {
    condition = (
      contains([
        "DataStrategy",
        "GSI",
        "IT",
        "MO&T",
        "NextGen"
      ], var.department)
    )
    error_message = "Invalid 'department' value. It must not be null and be one of: 'MO&T, NextGen, IT, DataStrategy'."
  }
}

variable "distribution_email" {
  description = "Distribution List."
  type        = string
  default     = null
}

variable "environment" {
  description = "Deployment environment of this application, workload, or service."
  type        = string
  validation {
    condition = (
      contains([
        "development",
        "development_integration",
        "non_production",
        "performance_testing",
        "production",
        "quality_assurance",
        "sandbox",
        "user_acceptance_testing"
      ], var.environment)
    )
    error_message = "Invalid 'environment'. It must not be null and be one of: 'development', 'development_integration', 'non_production', 'performance_testing', 'production', 'quality_assurance', 'sandbox', 'user_acceptance_testing'."
  }
}

variable "league" {
  type = string
  validation {
    condition = (
      contains([
        "NBA",
        "WNBA",
        "2k",
        "BAL",
        "GLeague"
      ], var.league)
    )
    error_message = "Invalid 'league'. It must not be null and be one of: 'NBA', 'WNBA', '2k', 'BAL', 'GLeague'."
  }
}

variable "pipeline_details" {
  description = "Azure DevOps IAC Pipeline From Which the resource was built. Expected format: <RepositoryName-RepositoryBranch-BuildPipelineName-ReleasePipelineName-ReleaseRunNumber>"
  type        = string
  default     = null
}

variable "sla" {
  description = "Acceptable downtime per month: Critical = 6nines/2.6 seconds, High = 5nines/26 seconds, Medium = 4nines/4.4 minutes, Low = 3nines/44 minutes."
  type        = string
  validation {
    condition = (
      contains([
        "Critical",
        "High",
        "Medium",
        "Low"
      ], var.sla)
    )
    error_message = "Invalid 'sla' value. It must not be null and be one of: 'Critical, High, Medium, Low'."
  }
}

variable "sub_department" {
  description = "Sub department/cost center within the department that the resource belongs to."
  type        = string
  validation {
    condition = (
      contains([
        "AppDev",
        "DataEng",
        "DPD",
        "DSA",
        "DTC",
        "Cyber",
        "Infra",
        "Stats"
      ], var.sub_department)
    )
    error_message = "Invalid 'sub_department' value. It must not be null and be one of: 'AppDev, DataEng, DPD, DSA, Infra, Stats, DTC, Cyber."
  }
}
