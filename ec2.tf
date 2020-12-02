# Create EC2 in eu-west-2
resource "aws_instance" "edx_instance" {
  ami           = data.aws_ssm_parameter.ubuntu-focal.value
  instance_type = var.instance_type
  //key_name                    = aws_key_pair.worker-key.key_name
  key_name = "prenovate-eu-central-1"
  //count                       = 2
  associate_public_ip_address = true
  root_block_device {
    volume_size = 100
  }

  vpc_security_group_ids = [aws_security_group.edx_group.id]

  provisioner "local-exec" {
    command = <<EOF
    aws --profile ${var.profile} ec2 wait instance-status-ok --region "eu-central-1" --instance-ids ${self.id}
    ansible-playbook --private-key prenovate-eu-central-1.pem --extra-vars 'passed_in_hosts=tag_Name_${self.tags.Name}' ansible_templates/edx_initial.yml
    EOF
  }








  //  provisioner "local-exec" {
  //
  //    command = <<EOF
  //  aws --profile ${var.profile} ec2 wait instance-status-ok --region ${var.aws_region} --instance-ids ${self.id}
  //  ansible-playbook -i '${self.public_ip},' --extra-vars 'passed_in_hosts=tag_Name_${self.tags.Name}'  --private-key ./prenovate-eu-west-2.pem ansible_templates/jenkins-worker-sample.yml
  //  EOF
  //  }

  tags = {
    Name = join("_", ["edx_instances_tf"])
  }


}

//resource "aws_eip" "edx_ip" {
//  instance = aws_instance.edx_instance.id
//  vpc      = true
//}
