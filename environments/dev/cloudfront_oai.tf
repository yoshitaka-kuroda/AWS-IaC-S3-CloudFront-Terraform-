resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for my static site"
}