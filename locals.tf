locals {

common_tags = {
  "managed-by"          = "terraform"
  "environment"         = local.environment
}

default_resource_group_name = "adamm-azure-k8stest"
default_location = "canadacentral"

clusters = {
  cluster1 = {
    name = "adamm"
    #resource_group_name = "adamm-azure-k8stest"
    #location = "canadacentral"
  }
}

all_clusters_information = flatten(
  [for cluster_name, cluster in local.clusters :
    {
      name = cluster_name
      resource_group_name = lookup(cluster, "resource_group_name", default_resource_group_name)
      location = lookup(cluster, "location", default_location)
    }  
  ]
)

}

module "resource_group" {
  for_each  = local.all_clusters_information
  name = each.value.name
  location = each.value.location
}