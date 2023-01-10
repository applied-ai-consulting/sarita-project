## Amazon EC2 instance with multiple dynamic  IP address 

## Overview

This solution will be responsible for creating a Amazon EC2 instance with multiple dynamic IP addresses in a existing VPC.

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> v2.17.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | AWS region | `string` | n/a | yes |
| Project | Project or organisation name | `string` | `devops-in-a-box` | yes |
| environment | Application environment name (dev/prod/qa) | `string` | n/a | yes |
| username | Name of the user who created  | `string` | n/a | yes |
| instance_type | Type of instance |`string`| "" | yes |
| ami | AMI ID of an instance | `string` | ""  | yes |
| monitoring |If true, the launched EC2 instance will have detailed monitoring enabled | `bool` | false| no |
| key_name | Key name of the Key Pair to use for the instance. which can be managed using the aws_key_pair resource | `string` |" "| yes |
| vpc_security_group_ids | The VPC ID to launch in | `list(any)` |" "| yes | 
| subnet_id | The VPC Subnet ID to launch in | `string` | " " | yes |
| security_group_id | A list of security group IDs to associate with | `list(any)` |" "| yes |



## Outputs

| Name | Description |
|------|-------------|
| instance_id         | Name of an instance  ID                             |
| public_ip_address   | Public IP address of an instance                    |
| first_private_ip    | Private IP address of an instance                   |
| second_private_ip   | Private IP address of an first_network_interface    |

## Development

### Prerequisites

- [terraform](https://learn.hashicorp.com/terraform/getting-started/install#installing-terraform)
- [terraform-docs](https://github.com/segmentio/terraform-docs)

## Prerequisites for terratest and HTML report genration

1. Export backend variables
```
    export bucket=<bucket_name>
    export key=<key_name>
    export region=<bucket_region>
```
 
 Add values infront of keys in terraform vars.tfvars file


To run terratest
please go through the below steps:

step 1: Terratest uses the Go   testing framework. To use Terratest, you need to install:
            `Go (requires version >=1.13)`

step 2 : To configure dependencies, run:
        cd Test
        go mod init test
        go mod tidy      //Required to download go.mod & go.sum files.//

step 3: To run the tests:
        go test -v filename_test.go
        
        
----------------------OR-------------------------

To run terratest and generate html report

step 1: Create pom.xml file in test folder.

step 2: Install [maven](https://maven.apache.org/install.html)

step 3: Run the mvn test command in  the test directory. This mvn test command will run the terrtest go file and will generate report in html format.


