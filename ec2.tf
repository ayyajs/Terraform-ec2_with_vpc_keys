resource "aws_instance" "web_instance" {
  ami           = "ami-074dc0a6f6c764218"
  instance_type = "t2.nano"
  //key_name      = "web"

  key_name      = aws_key_pair.kp.key_name

  subnet_id                   = aws_subnet.some_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"    
    Name = "newserver"
  }
}