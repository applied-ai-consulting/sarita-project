resource "aws_networkfirewall_firewall_policy" "example" {
  name = "example"
  firewall_policy {
    stateless_default_actions          = ["aws:pass"]
    stateless_fragment_default_actions = ["aws:drop"]
    stateful_rule_group_reference {
      resource_arn = aws_networkfirewall_rule_group.example.arn
    }
  
  }
}
resource "aws_networkfirewall_firewall" "example" {
  name                = "example"
  firewall_policy_arn = aws_networkfirewall_firewall_policy.example.arn
   vpc_id              = var.vpc_id

  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping
    content {
      subnet_id = subnet_mapping.value
    }
  }
}

resource "aws_networkfirewall_rule_group" "example" {
  capacity = 100
  name     = "example"
  type     = "STATEFUL"
  rule_group {
    rules_source {
      stateful_rule {
        action = "PASS"
        header {
          destination      = "0.0.0.0/0"
          destination_port = 22
          direction        = "ANY"
          protocol         = "TCP"
          source           = "0.0.0.0/0"
          source_port      = 22
        }
        rule_option {
          keyword = "sid:1"
        }
      }
    }
  }

  tags = {
    Tag1 = "Value1"
    Tag2 = "Value2"
  }
}
