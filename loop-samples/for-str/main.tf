variable "names" {
  description = "Names to render"
  type        = list(string)
  default     = ["ralph", "milhouse", "nelson","martin","lenny"]
}

output "for_directive" {
  value = "%{ for name in var.names }${name}, %{ endfor }"
}

output "for_directive_index" {
  value = "%{ for i, name in var.names }(${i}) ${name}, %{ endfor }"
}
