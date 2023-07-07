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
| http | n/a |

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
| name | Name of the thing |

<!--- END_TF_DOCS --->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | >= 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.ssm_activation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm_activation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iot_certificate.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_certificate) | resource |
| [aws_iot_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_policy) | resource |
| [aws_iot_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_policy_attachment) | resource |
| [aws_iot_thing.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_thing) | resource |
| [aws_iot_thing_principal_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iot_thing_principal_attachment) | resource |
| [aws_ssm_activation.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_activation) | resource |
| [aws_ssm_parameter.certificate_pem](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.private_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.public_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.root_ca_crt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.ssm_activation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_iam_policy_document.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssm_activation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [http_http.root_ca](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the edge device | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the SSM Parameter | `map(string)` | n/a | yes |
| <a name="input_create_ssm_activation"></a> [create\_ssm\_activation](#input\_create\_ssm\_activation) | The Flag which determines if SSM activation resouces should be created | `bool` | `true` | no |
| <a name="input_expiration_duration"></a> [expiration\_duration](#input\_expiration\_duration) | The expiration period of the SSM activation, default 4 weeks | `string` | `"672h"` | no |
| <a name="input_iot_policy"></a> [iot\_policy](#input\_iot\_policy) | The policy to attach to the Thing | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The KMS key ID used to encrypt all data | `string` | `null` | no |
| <a name="input_ssm_activation_role_id"></a> [ssm\_activation\_role\_id](#input\_ssm\_activation\_role\_id) | The ID of the role to attach to the SSM activation | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the thing |
| <a name="output_certificate_arn"></a> [certificate\_arn](#output\_certificate\_arn) | ARN of the certificate |
| <a name="output_certificate_id"></a> [certificate\_id](#output\_certificate\_id) | Id of the certificate |
| <a name="output_certificate_pem"></a> [certificate\_pem](#output\_certificate\_pem) | Path of the SSM Parameter for IoT certificate pem |
| <a name="output_certificate_private_key"></a> [certificate\_private\_key](#output\_certificate\_private\_key) | Path of the SSM Parameter for IoT certificate private key |
| <a name="output_certificate_public_key"></a> [certificate\_public\_key](#output\_certificate\_public\_key) | Path of the SSM Parameter for IoT certificate public key |
| <a name="output_name"></a> [name](#output\_name) | Name of the thing |
<!-- END_TF_DOCS -->