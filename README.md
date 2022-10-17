[![Lint](https://github.com/giovannirossini/terraform/actions/workflows/lint.yml/badge.svg)](https://github.com/giovannirossini/terraform/actions/workflows/lint.yml)
[![Infracost](https://github.com/giovannirossini/terraform/actions/workflows/infracost.yml/badge.svg)](https://github.com/giovannirossini/terraform/actions/workflows/infracost.yml)

* [EKS](aws/eks)
* [Modules](aws/modules)

---

[//]: <> (infracost-comment)

💰 Infracost estimate: **monthly cost will be ~ $449**.
<table>
  <thead>
    <td>Project</td>
    <td>Price</td>
  </thead>
  <tbody>
    <tr>
      <td>aws/modules/acm</td>
      <td align="right">$0</td>
    </tr>
    <tr>
      <td>aws/modules/efs</td>
      <td align="right">$0</td>
    </tr>
    <tr>
      <td>aws/modules/elasticache</td>
      <td align="right">$12.41</td>
    </tr>
    <tr>
      <td>aws/modules/opensearch</td>
      <td align="right">$1.35</td>
    </tr>
    <tr>
      <td>aws/modules/route53</td>
      <td align="right">$0.50</td>
    </tr>
    <tr>
      <td>aws/modules/alb</td>
      <td align="right">$16.43</td>
    </tr>
    <tr>
      <td>aws/modules/ec2</td>
      <td align="right">$9.76</td>
    </tr>
    <tr>
      <td>aws/modules/eks</td>
      <td align="right">$120</td>
    </tr>
    <tr>
      <td>aws/modules/rds</td>
      <td align="right">$89.79</td>
    </tr>
    <tr>
      <td>aws/eks</td>
      <td align="right">$198</td>
    </tr>
    <tr>
      <td>All projects</td>
      <td align="right">$449</td>
    </tr>
  </tbody>
</table>

1 project has no cost estimate changes.

<details>
<summary><strong>Infracost output</strong></summary>

```
Project: aws/modules/acm
Module path: aws/modules/acm

+ aws_route53_record.cert_validation
  Monthly cost depends on usage

    + Standard queries (first 1B)
      Monthly cost depends on usage
        +$0.40 per 1M queries

    + Latency based routing queries (first 1B)
      Monthly cost depends on usage
        +$0.60 per 1M queries

    + Geo DNS queries (first 1B)
      Monthly cost depends on usage
        +$0.70 per 1M queries

Monthly cost change for aws/modules/acm (Module path: aws/modules/acm)
Amount:  $0.00 ($0.00 → $0.00)

──────────────────────────────────
Project: aws/modules/efs
Module path: aws/modules/efs

+ aws_efs_file_system.efs_production
  Monthly cost depends on usage

    + Storage (standard)
      Monthly cost depends on usage
        +$0.30 per GB

Monthly cost change for aws/modules/efs (Module path: aws/modules/efs)
Amount:  $0.00 ($0.00 → $0.00)

──────────────────────────────────
Project: aws/modules/elasticache
Module path: aws/modules/elasticache

+ aws_elasticache_cluster.redis
  +$12.41

    + ElastiCache (on-demand, cache.t3.micro)
      +$12.41

Monthly cost change for aws/modules/elasticache (Module path: aws/modules/elasticache)
Amount:  +$12.41 ($0.00 → $12.41)

──────────────────────────────────
Project: aws/modules/opensearch
Module path: aws/modules/opensearch

+ aws_elasticsearch_domain.es
  +$1.35

    + Instance (on-demand, t2.small.elastsearch)
      $0.00

    + Storage (gp2)
      +$1.35

Monthly cost change for aws/modules/opensearch (Module path: aws/modules/opensearch)
Amount:  +$1.35 ($0.00 → $1.35)

──────────────────────────────────
Project: aws/modules/route53
Module path: aws/modules/route53

+ aws_route53_zone.main
  +$0.50

    + Hosted zone
      +$0.50

Monthly cost change for aws/modules/route53 (Module path: aws/modules/route53)
Amount:  +$0.50 ($0.00 → $0.50)

──────────────────────────────────
Project: aws/modules/alb
Module path: aws/modules/alb

+ aws_lb.alb
  +$16.43

    + Application load balancer
      +$16.43

    + Load balancer capacity units
      Monthly cost depends on usage
        +$5.84 per LCU

Monthly cost change for aws/modules/alb (Module path: aws/modules/alb)
Amount:  +$16.43 ($0.00 → $16.43)

──────────────────────────────────
Project: aws/modules/ec2
Module path: aws/modules/ec2

+ aws_instance.ec2[0]
  +$9.76

    + Instance usage (Linux/UNIX, on-demand, t3a.micro)
      +$6.86

    + EC2 detailed monitoring
      +$2.10

    + root_block_device

        + Storage (general purpose SSD, gp2)
          +$0.80

Monthly cost change for aws/modules/ec2 (Module path: aws/modules/ec2)
Amount:  +$9.76 ($0.00 → $9.76)

──────────────────────────────────
Project: aws/modules/eks
Module path: aws/modules/eks

+ aws_eks_cluster.cluster
  +$73.00

    + EKS cluster
      +$73.00

+ aws_eks_node_group.nodes
  +$47.17

    + Instance usage (Linux/UNIX, on-demand, t3a.small)
      +$41.17

    + Storage (general purpose SSD, gp2)
      +$6.00

Monthly cost change for aws/modules/eks (Module path: aws/modules/eks)
Amount:  +$120 ($0.00 → $120)

──────────────────────────────────
Project: aws/modules/rds
Module path: aws/modules/rds

+ aws_rds_cluster.cluster
  Monthly cost depends on usage

    + Storage
      Monthly cost depends on usage
        +$0.10 per GB

    + I/O requests
      Monthly cost depends on usage
        +$0.20 per 1M requests

    + Backtrack
      Monthly cost depends on usage
        +$0.012 per 1M change-records

    + Snapshot export
      Monthly cost depends on usage
        +$0.01 per GB

+ aws_rds_cluster_instance.instances[0]
  +$29.93

    + Database instance (on-demand, db.t3.small)
      +$29.93

+ aws_rds_cluster_instance.instances[1]
  +$29.93

    + Database instance (on-demand, db.t3.small)
      +$29.93

+ aws_rds_cluster_instance.instances[2]
  +$29.93

    + Database instance (on-demand, db.t3.small)
      +$29.93

Monthly cost change for aws/modules/rds (Module path: aws/modules/rds)
Amount:  +$89.79 ($0.00 → $89.79)

──────────────────────────────────
Project: aws/eks
Module path: aws/eks

+ module.eks.aws_eks_cluster.cluster
  +$73.00

    + EKS cluster
      +$73.00

+ module.eks.aws_eks_node_group.nodes
  +$125

    + Instance usage (Linux/UNIX, on-demand, t3.large)
      +$121

    + CPU credits
      $0.00

    + Storage (general purpose SSD, gp2)
      +$4.00

Monthly cost change for aws/eks (Module path: aws/eks)
Amount:  +$198 ($0.00 → $198)

──────────────────────────────────

The following projects have no cost estimate changes: aws/modules/network (Module path: aws/modules/network)
Run the following command to see their breakdown: infracost breakdown --path=/path/to/code

──────────────────────────────────
Key: ~ changed, + added, - removed

83 cloud resources were detected:
∙ 15 were estimated, 11 of which include usage-based costs, see https://infracost.io/usage-file
∙ 68 were free:
  ∙ 14 x aws_lb_target_group_attachment
  ∙ 10 x aws_efs_mount_target
  ∙ 10 x aws_iam_role_policy_attachment
  ∙ 5 x aws_route_table_association
  ∙ 5 x aws_subnet
  ∙ 4 x aws_iam_role
  ∙ 2 x aws_default_route_table
  ∙ 2 x aws_internet_gateway
  ∙ 2 x aws_security_group
  ∙ 2 x aws_security_group_rule
  ∙ 2 x aws_vpc
  ∙ 1 x aws_acm_certificate
  ∙ 1 x aws_acm_certificate_validation
  ∙ 1 x aws_db_subnet_group
  ∙ 1 x aws_efs_access_point
  ∙ 1 x aws_eip
  ∙ 1 x aws_elasticache_subnet_group
  ∙ 1 x aws_iam_service_linked_role
  ∙ 1 x aws_key_pair
  ∙ 1 x aws_lb_listener
  ∙ 1 x aws_lb_target_group
```
</details>