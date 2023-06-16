terraform {
  required_version = ">= 1.0.0, < 2.0.0"
}

variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["monty", "waylon", "bart", "lisa", "maggie"]
}

output "upper_names" {
  value = [for name in var.names : upper(name)]
}

output "short_upper_names" {
  value = [for name in var.names : upper(name) if length(name) < 5]
}

variable "simpsons" {
  description = "map"
  type        = map(string)
  default = {
    apu        = "shop keeper"
    moe        = "bar keep"
    krusty     = "clown"
    dr_hibbert = "doctor"
    clancy     = "police man"
  }
}

output "bios" {
  value = [for name, role in var.simpsons : "${name} is the ${role}"]
}

output "upper_roles" {
  value = { for name, role in var.simpsons : upper(name) => upper(role) }
}

