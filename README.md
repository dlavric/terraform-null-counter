# Repository for learning Terraform
This repository is for running Terraform with the `Null provider` and the `count.index` object for learning purposes

## This Repository creates a Null provider with Terraform

## Instructions

### Prerequisites

- [X] [Terraform](https://www.terraform.io/downloads)

## How to Use this Repo

- Clone this repository:
```shell
git clone git@github.com:dlavric/terraform-null-counter.git
```

- Go to the directory where the repo is stored and make sure the `main.tf` file is there too:
```shell
cd terraform-null-counter
```

- Run `terraform init`, to download any external dependency
```shell
terraform init
```

This is the output of initializing the Terraform code:
```shell
Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/null...
- Installing hashicorp/null v3.1.0...
- Installed hashicorp/null v3.1.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

- Apply the changes with Terraform
```shell
terraform apply
```

This is the output for applying the changes:
```shell
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.null[0] will be created
  + resource "null_resource" "null" {
      + id = (known after apply)
    }

  # null_resource.null[1] will be created
  + resource "null_resource" "null" {
      + id = (known after apply)
    }

  # null_resource.null[2] will be created
  + resource "null_resource" "null" {
      + id = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.null[2]: Creating...
null_resource.null[1]: Creating...
null_resource.null[0]: Creating...
null_resource.null[2]: Provisioning with 'local-exec'...
null_resource.null[0]: Provisioning with 'local-exec'...
null_resource.null[1]: Provisioning with 'local-exec'...
null_resource.null[1] (local-exec): Executing: ["/bin/sh" "-c" "echo The number is 1"]
null_resource.null[0] (local-exec): Executing: ["/bin/sh" "-c" "echo The number is 0"]
null_resource.null[2] (local-exec): Executing: ["/bin/sh" "-c" "echo The number is 2"]
null_resource.null[1] (local-exec): The number is 1
null_resource.null[0] (local-exec): The number is 0
null_resource.null[1]: Creation complete after 0s [id=839283742247187466]
null_resource.null[0]: Creation complete after 0s [id=166090675650804321]
null_resource.null[2] (local-exec): The number is 2
null_resource.null[2]: Creation complete after 0s [id=3465182971420951847]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```

- Destroy the instance
```shell
terraform destroy
```

This is how it is supposed to look after destroying the changes:
```shell
null_resource.null[1]: Refreshing state... [id=839283742247187466]
null_resource.null[2]: Refreshing state... [id=3465182971420951847]
null_resource.null[0]: Refreshing state... [id=166090675650804321]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # null_resource.null[0] will be destroyed
  - resource "null_resource" "null" {
      - id = "166090675650804321" -> null
    }

  # null_resource.null[1] will be destroyed
  - resource "null_resource" "null" {
      - id = "839283742247187466" -> null
    }

  # null_resource.null[2] will be destroyed
  - resource "null_resource" "null" {
      - id = "3465182971420951847" -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.null[0]: Destroying... [id=166090675650804321]
null_resource.null[1]: Destroying... [id=839283742247187466]
null_resource.null[2]: Destroying... [id=3465182971420951847]
null_resource.null[1]: Destruction complete after 0s
null_resource.null[0]: Destruction complete after 0s
null_resource.null[2]: Destruction complete after 0s

Destroy complete! Resources: 3 destroyed.
```