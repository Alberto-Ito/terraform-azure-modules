output "id" {
    description = "The id for the group object."
    value       = databricks_group.create_group.id
}


output "user_id" {
    description = "Canonical unique identifier for the use"
    value       = databricks_user.create_user.id
}

output "group_member_id" {
    description = "id - The id for the databricks_group_member object which is in the format <group_id>|<member_id>."
    value       = databricks_group_member.add_user_to_group.id
}