//################################
//## Master Security Groups     ##
//################################


resource "aws_security_group" "edx_group" {
  name        = "Edx-Access-SG"
  description = "Allow EDX ports and 22"


  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    //cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
    description = "Allow 22 from our public IP"
  }

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow LMS"
  }

  ingress {
    from_port   = 443
    protocol    = "TCP"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS"
  }

  ingress {
    from_port   = 18090
    protocol    = "TCP"
    to_port     = 18090
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Certs"
  }

  ingress {
    from_port   = 18381
    protocol    = "TCP"
    to_port     = 18381
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Discovery"
  }

  ingress {
    from_port   = 18010
    protocol    = "TCP"
    to_port     = 18010
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow CMS"
  }

  ingress {
    from_port   = 18130
    protocol    = "TCP"
    to_port     = 18130
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Ecommerce"
  }

  ingress {
    from_port   = 8099
    protocol    = "TCP"
    to_port     = 8099
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow edx-release"
  }

  ingress {
    from_port   = 18080
    protocol    = "TCP"
    to_port     = 18080
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Forum"
  }

  ingress {
    from_port   = 18040
    protocol    = "TCP"
    to_port     = 18040
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Xqueue"
  }




  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


//################################
//## Worker Security Groups     ##
//################################
//
//resource "aws_security_group" "jenkins_sg_london" {
//  provider    = aws.region_worker
//  name        = "Jenkins-Worker-SG-London"
//  description = "Allow TCP/8080 and 22"
//  vpc_id      = aws_vpc.vpc_master_london.id
//
//  ingress {
//    from_port   = 22
//    protocol    = "TCP"
//    to_port     = 22
//    cidr_blocks = ["0.0.0.0/0"]
//    //cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
//    description = "Allow ssh from our public IP"
//  }
//
//  ingress {
//    from_port   = 0
//    protocol    = "-1"
//    to_port     = 0
//    cidr_blocks = ["10.0.1.0/24"]
//  }
//
//
//
//  egress {
//    from_port   = 0
//    protocol    = "-1"
//    to_port     = 0
//    cidr_blocks = ["0.0.0.0/0"]
//  }
//}