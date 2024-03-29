resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "ssh_private_key" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = join(".", [var.name != "" ? var.name : "terraform", "pem"])
  file_permission = "0600"
}

resource "local_file" "ssh_public_key" {
  content         = tls_private_key.ssh.public_key_openssh
  filename        = "id_rsa.pub"
  file_permission = "0600"
}

resource "aws_key_pair" "sshkey" {
  key_name   = var.key_name
  public_key = chomp(tls_private_key.ssh.public_key_openssh)
}