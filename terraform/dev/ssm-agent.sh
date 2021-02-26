#!/bin/bash
sudo su
wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.debsudo dpkg -i amazon-ssm-agent.deb
systemctl enable amazon-ssm-agent
