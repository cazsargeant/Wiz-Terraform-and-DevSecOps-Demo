variable "wiz_environment" {
  description = "Wiz tenant environment. Use prod, gov, or fedramp."
  type        = string
  default     = "prod"

  validation {
    condition     = contains(["prod", "gov", "fedramp"], var.wiz_environment)
    error_message = "wiz_environment must be one of: prod, gov, fedramp."
  }
}

variable "cloud_account_search" {
  description = "Optional search terms for Wiz cloud accounts."
  type        = set(string)
  default     = []
}

variable "cloud_providers" {
  description = "Optional cloud provider filters. Defaults to GCP for this example."
  type        = set(string)
  default     = ["GCP"]
}

variable "registry_search" {
  description = "Optional search term for Wiz container registries."
  type        = string
  default     = ""
}

variable "registry_types" {
  description = "Optional container registry type filters. Defaults to Google Artifact Registry and Google Container Registry."
  type        = set(string)
  default     = ["GAR", "GCR"]
}

variable "kubernetes_cluster_search" {
  description = "Optional search term for Wiz Kubernetes clusters."
  type        = string
  default     = ""
}

variable "kubernetes_cluster_kinds" {
  description = "Optional Kubernetes cluster kind filters. Defaults to GKE for this example."
  type        = set(string)
  default     = ["GKE"]
}

variable "kubernetes_namespace_search" {
  description = "Optional search term for Wiz Kubernetes namespaces."
  type        = string
  default     = ""
}
