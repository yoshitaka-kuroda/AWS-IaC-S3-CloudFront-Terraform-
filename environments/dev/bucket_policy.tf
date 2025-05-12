data "aws_iam_policy_document" "site_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.example.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.oai.iam_arn
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "site_policy" {
  bucket = aws_s3_bucket.example.id
  policy = data.aws_iam_policy_document.site_policy.json
}