# AWS Static Website Terraform Module

![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.12.0-blue.svg) [![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Terraform module which provision required AWS resources to host a performant and secured static website.

## Features

This Terraform module creates the following AWS resources:

* **AWS Certificate Manager**: wildcard certificate for your domain.
* **S3**
  * Bucket #1: to store the content (`example.com`).
* **CloudFront**
  * Distribution #1: to frontend the website.
* **Route53** record sets pointing to the two CloudFront distributions.


## Usage

```HCL

module "aws_static_website" {
  source = "hendrixroa/static-https-website/aws"

  website-domain-main = "example.com"
  prefix_subdomain    = "docs"
  route53_zone_id     = "some route53 id"
  acm_certificate_arn = "acm certificate"
}
```