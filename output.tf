output "website_cdn_id" {
  description = "Main CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.website.id
}

output "website_cdn_domain" {
  description = "Main CloudFront Distribution domain"
  value       = aws_cloudfront_distribution.website.domain_name
}

output "website_bucket" {
  value = aws_s3_bucket.website.bucket
}