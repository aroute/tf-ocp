data "ibm_resource_group" "resource_group" {
  name = "default"
}

resource "ibm_container_cluster" "tfcluster" {
    name            = "tfcluster"
    datacenter      = "dal13"
    machine_type    = "b3c.4x16"
    hardware        = "shared"
    public_vlan_id  = "2910272"
    private_vlan_id = "2910274"

    kube_version = "4.6_openshift"

    default_pool_size = 3

    public_service_endpoint  = "true"
    private_service_endpoint = "true"

    resource_group_id = data.ibm_resource_group.resource_group.id
}
