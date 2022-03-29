resource "aws_lb" "alb" {
  name                = var.name
  internal            = var.is_internal
  load_balancer_type  = var.type
  security_groups     = var.sg_id
  subnets             = var.subnets

  tags                = {
    Name              = var.name
  }
}

resource "aws_lb_target_group" "target_group" {
  name                = var.name
  port                = var.port
  protocol            = var.protocol
  vpc_id              = var.vpc_id
}

resource "aws_lb_target_group_attachment" "instance_group" {
  depends_on          = [aws_lb_target_group.target_group]
  count               = length(var.instance_id)
  target_group_arn    = aws_lb_target_group.target_group.arn
  target_id           = element(var.instance_id,count.index)
  port                = var.instance_port
}

resource "aws_lb_listener" "listener" {
  depends_on          = [aws_lb.alb]
  load_balancer_arn   = aws_lb.alb.arn
  port                = var.port
  protocol            = var.protocol
  default_action {
    type              = "forward"
    target_group_arn  = aws_lb_target_group.target_group.arn
  }
}