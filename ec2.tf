provider aws{
  region     = "us-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

#### Defining Vars ####

variable vpc_id {
  type        = string
  #default     = "vpc-655f5f02"
  description = "Customer Provided Value"
}

variable subnet_id {
  type        = string
  #default     = "subnet-36424d6d"
  description = "Customer Provided Value"
}

variable "az" {
  type        = string
  #default     = ""
  description = " Customer Provided value"
}

variable instance_type {
  type        = string
  #default     = "t2.micro"
  description = "Customer Provided Value"
}

variable "access_key" {
  type        = string
  #default     = ""
  description = " Customer Provided value"
}

variable "secret_key" {
  type        = string
  #default     = ""
  description = " Customer Provided value"
}

#### Creating Key_Pair ####

resource "aws_key_pair" "Terra" {
  key_name   = "Terra"
  public_key =  file("Terra.pub")
}


### Creating Security Group ####

resource "aws_security_group" "SSH-Access" {
  name   = "SSH-Access"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["192.8.160.0/24"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.8.160.0/24"]
  }

  tags = {
        Owner       = "Avinaw"
        Purpose     = "MyCloud_UseCase"
        Expiry_Date = "17/09/2020"
  }
}

#### Creating Instance ####

resource "aws_instance" "Unix_server" {
  ami                     = "ami-066df92ac6f03efca"
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  key_name                = aws_key_pair.Terra.id
  availability_zone       = "us-west-1b"
  vpc_security_group_ids  = [aws_security_group.SSH-Access_win.id]

  tags = {
        Owner       = "Avinaw"
        Purpose     = "MyCloud_UseCase"
        Expiry_Date = "17/09/2020"
  }
}
