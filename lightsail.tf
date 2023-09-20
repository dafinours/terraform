resource provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region
}

resource "aws_lightsail_instance" "Nation" {
  name              = "Nation"
  availability_zone = "us-east-1a" 
  blueprint_id      = "centos_7_2009_01"  # Specify your custom blueprint ID
  bundle_id         = "nano_2_0"    

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello from user data script!" > /var/www/html/index.html
              systemctl enable httpd
              systemctl start httpd
              EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example_instance.public_ip_address
}
