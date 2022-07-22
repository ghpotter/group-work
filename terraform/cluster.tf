resource "aws_launch_configuration" "ecs_launch_config" {
    image_id                    = "ami-0cff7528ff583bf9a"
    iam_instance_profile        = aws_iam_instance_profile.ecs_agent.name
    security_groups             = [aws_security_group.terraform_access.id]
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER=my-cluster >> /etc/ecs/ecs.config"
    associate_public_ip_address = "true"
    instance_type               = "t2.medium"
    key_name                    = "rd-key"
}

resource "aws_autoscaling_group" "failure_analysis_ecs_asg" {
    name                      = "asg"
    vpc_zone_identifier       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
    launch_configuration      = aws_launch_configuration.ecs_launch_config.name

    desired_capacity          = 2
    min_size                  = 2
    max_size                  = 2
}