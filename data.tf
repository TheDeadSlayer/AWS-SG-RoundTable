data "template_file" "npm_app" {
  template = "${file("scripts/npm_app.tpl")}"

  vars = {
    bucket_name = "${aws_s3_bucket.build_bucket.id}"
    default_port = var.default_port
  }
}
data "template_file" "s3_public_read_policy" {
  template = "${file("scripts/public_read_policy.tpl")}"
  vars = {
    bucket_name = "${aws_s3_bucket.build_bucket.id}"
  }
}