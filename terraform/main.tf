provider "aws" {
  region = "ap-southeast-1"
}
resource "aws_eks_cluster" "this" {
  name     = "blue-green-eks"
  role_arn = "arn:aws:iam::123456789012:role/EKSClusterRole"
  vpc_config { subnet_ids = ["subnet-xxxxxx"] }
}