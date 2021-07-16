# terraform-aws-mcaf-edgedevice

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the edge device | `string` | n/a | yes |
| tags | A mapping of tags to assign to the SSM Parameter | `map(string)` | n/a | yes |
| expiration\_duration | The expiration period of the SSM activation, default 4 weeks | `string` | `"672h"` | no |
| iot\_policy | The policy to attach to the Thing | `string` | `null` | no |
| kms\_key\_id | The KMS key ID used to encrypt all data | `string` | `null` | no |
| ssm\_activation\_role\_id | The ID of the role to attach to the SSM activation | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the thing |
| certificate\_arn | ARN of the certificate |
| certificate\_id | Id of the certificate |
| certificate\_pem | Path of the SSM Parameter for IoT certificate pem |
| certificate\_private\_key | Path of the SSM Parameter for IoT certificate private key |
| certificate\_public\_key | Path of the SSM Parameter for IoT certificate public key |
| kms\_key\_arn | KMS key arn used for encrypting SSM Parameters for edge devices |
| kms\_key\_id | KMS key id used for encrypting SSM Parameters for edge devices |
| name | Name of the thing |

<!--- END_TF_DOCS --->
