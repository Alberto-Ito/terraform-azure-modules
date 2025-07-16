locals {
  environment_map = {
    production              = "PROD"
    performance_testing     = "PERF"
    non_production          = "PROD"
    user_acceptance_testing = "UAT"
    quality_assurance       = "QA"
    development_integration = "DEVINT"
    development             = "DEV"
    sandbox                 = "SBox"
  }
}

locals {
  tags = {
    Application        = "${var.application}"
    DataClassification = "${var.data_classification}"
    Department         = "${var.department}"
    DistroEmail        = "${var.distribution_email}"
    Environment        = "${lookup(local.environment_map, var.environment)}"
    League             = "${var.league}"
    PipelineDetails    = "${var.pipeline_details}"
    SLA                = "${var.sla}"
    SubDepartment      = "${var.sub_department}"
  }
}
