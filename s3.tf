resource "aws_s3_bucket" "website" {
  bucket = "${var.website-domain-main}-source"
  acl    = "public-read"

  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_s3_bucket_policy" "update_website_root_bucket_policy" {
  bucket = aws_s3_bucket.website.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "PolicyForWebsiteEndpointsPublicContent",
  "Statement": [
    {
      "Sid": "PublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "${aws_s3_bucket.website.arn}/*",
        "${aws_s3_bucket.website.arn}"
      ]
    }
  ]
}
POLICY
}