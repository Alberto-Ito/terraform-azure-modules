variable "synapse_managed_private_endpoint_name" {
    description = "Specifies the name which should be used for this Managed Private Endpoint. Changing this forces a new resource to be created."
}

variable "synapse_workspace_id" {
description = "The ID of the Synapse Workspace on which to create the Managed Private Endpoint. Changing this forces a new resource to be created."
}

# NOTE:
# A Synapse firewall rule including local IP is needed for managing current resource.

variable "target_resource_id" {
    description = "The ID of the Private Link Enabled Remote Resource which this Synapse Private Endpoint should be connected to. Changing this forces a new resource to be created."
}

variable "subresource_name" {
    description = "Specifies the sub resource name which the Synapse Private Endpoint is able to connect to. Changing this forces a new resource to be created."
    # List of resource names: https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview#private-link-resource
}