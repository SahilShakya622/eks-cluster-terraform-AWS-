module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.29"
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  cluster_endpoint_public_access = true

  create_iam_role          = true
  iam_role_name            = "eks-cluster-role"
  iam_role_use_name_prefix = false

  iam_role_additional_policies = {
    AmazonEKSClusterPolicy         = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    AmazonEKSVPCResourceController = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  }

  eks_managed_node_groups = {
    core_nodes = {
      min_size     = 2
      max_size     = 6
      desired_size = 3

      instance_types = [
        "t3.medium", "t3a.medium",
        "m5.large", "m5a.large",
        "c5.large", "r5.large"
      ]

      capacity_type = "SPOT"
      instance_distribution = {
        on_demand_base_capacity                  = 1
        on_demand_percentage_above_base_capacity = 40
        spot_allocation_strategy                 = "capacity-optimized"
      }

      attach_policy_arns = [
        "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
        "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      ]

      subnet_ids = var.subnet_ids

      taints = [{
        key    = "dedicated"
        value  = "core"
        effect = "NO_SCHEDULE"
      }]

      labels = {
        role = "core"
      }
    }
  }

  tags = {
    Environment = "production"
    Terraform   = "true"
  }
}
