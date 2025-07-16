
variable "azresource" {
   default =   ""
}


variable "linked_redis_cache_id" {
 description = "The ID of the linked Redis cache. Changing this forces a new Redis to be created."
}

variable "linked_redis_cache_location" {
    description = "The location of the linked Redis cache. Changing this forces a new Redis to be created."
}

variable "target_redis_cache_name" {
 description = "The name of Redis cache to link with. Changing this forces a new Redis to be created. (eg The primary role)"
}

variable "resource_group_name" {
    description = "The name of the Resource Group where the Redis caches exists. Changing this forces a new Redis to be created."
}

variable "server_role" {
description = "The role of the linked Redis cache (eg Secondary). Changing this forces a new Redis to be created."
default = "Secondary"
}