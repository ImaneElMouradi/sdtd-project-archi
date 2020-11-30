variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_SESSION_TOKEN" {}
variable "AWS_REGION" {
	default = "us-east-1"
}
variable "AMIS" {
	type  = map(string)
	default = {
		us-east-1 = "ami-054e49cb26c2fd312"
	}
}
