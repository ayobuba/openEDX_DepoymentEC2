
resource "null_resource" "config_yml_edx" {

  triggers = {
    build_number = timestamp()
  }
  depends_on = [aws_instance.edx_instance]
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = aws_instance.edx_instance.public_ip
      private_key = file("prenovate-eu-central-1.pem")
      agent       = false
      timeout     = "2m"
    }

    inline = [
      "sudo wget https://raw.githubusercontent.com/lpm0073/edx.scripts/master/edx.platform-install.sh",
      "sudo chmod 755 edx.platform-install.sh",
      "sudo ./edx.platform-install.sh "
    ]

  }

}

//resource "null_resource" "install_edx" {
//
//  provisioner "remote-exec" {
//    connection {
//      type        = "ssh"
//      user        = "ubuntu"
//      host        = aws_instance.edx_instance.public_ip
//      private_key = file("prenovate-eu-central-1.pem")
//      agent       = false
//      timeout     = "2m"
//    }
//
//    inline = [
//      "sudo wget https://raw.githubusercontent.com/lpm0073/edx.scripts/master/edx.platform-install.sh",
//      "sudo chmod 755 edx.platform-install.sh",
//      "sudo nohup ./edx.platform-install.sh &"
//
//    ]
//  }
//  depends_on = [null_resource.config_yml_edx]
//}