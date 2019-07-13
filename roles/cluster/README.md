
  
  

# Apprenticeship Resources

  
  
  

## Cluster Role

  

>  - The cluster role creates a vpc, subnet and a k8s cluster

>- It has a template directory which contains some jinja templates, these templates files are used to generate Terraform files during execution.

>- Tags are used to run selected part of the playbook

>

  

## Usage

* export this variable **GOOGLE_APPLICATION_CREDENTIALS=" "** (value should be your google account service keys path).

```sh

export  $GOOGLE_APPLICATION_CREDENTIALS

```

* Update the **cluster/defaults/main.yml** with your variables

These variables  are needed to create the cluster, they are interpolated with the cluster template variables when Ansible is generating the Terraform files from the templates files.

  
  

### Create a Cluster (Using the cluster_playbook.yml)

  
  

To create a cluster infrastructure using the cluster_playbook.yml, run

  

```sh

ansible-playbook cluster_playbook.yml --tags="create"

```

  

To destroy cluster infrastructure, run

  

```sh

ansible-playbook cluster_playbook.yml --tags="destroy"

```

  

To clean up the terraform files generated when creating the cluster run

  

```sh

ansible-playbook cluster_playbook.yml --tags="clean"

```

  
  
  

### Import cluster role into your playbook

  

You can also import the cluster role directly into your playbook. See example below

  

```sh

  

---

- hosts: localhost

gather_facts: false

roles:

- cluster

```

  

## State file

  

By default, the state file is stored in a bucket **cluster-tf-state** inside **terraform/state** folder.

  

If you want to maintain your own state file you can update this variables to point to your own bucket and folders

```sh

  

state_file_folder: terraform/state

state_file_bucket: cluster-tf-state

```

## Variables
The following table lists the configurable variables for creating the cluster and their default value

Parameter | Description | Default
--------- | ----------- | -------
`project_id:` | GCP project ID | 
`env:` | The environment the cluster belongs to. e.g. `staging` `production` |
`product:` | Name of the product, this is used as labels. e.g. `Travela` |
`owner:` | Label of the owner |
`maintainer:` | Lable of the maintainer |
`state:` | Label to show if the cluster is in use |`in_use`
`region:` | The Region the cluster should be created in |
`location:` | the Location the cluster should be created in | 
`cluster_name:` | The name of the cluster |
`vpc_name:` | The name of the VPC |
`subnet_name:` | The name of the subnet |
`node_count: ` | Number of initial Nodes the cluster should have | `3`
`min_node_count: ` | Minimium node count| `3`
`max_node_count: ` | Maximium node count | `5`
`auto_upgrade:` | Cluster management |  `true`
`ip_cidr_range: ` | ip_cidr_range for  VPC | `10.0.0.0/18`
`private_ip_google_access:` | Set to true if you want private ip assigned automatically| `true`
`node_pool_name: ` | Name of your node pool | `default-pool`
`state_file_folder: ` | The folder that holds your Terraform state files | `terraform/state`
`state_file_bucket: ` | The name of the bucket used as the remote backend | `cluster-tf-state`
`k8s_cluster_dir: ` | Full path to the folder where your terraform files are generated into, usually inside `{{playbook_dir}}/roles/cluster/files/{{folder_name}}` where `folder_name` is the name of the folder created when running the playbook, default `folder_name` is `terraform` e.g `/apprenticeship_resources/roles/cluster/files/terraform` | 
