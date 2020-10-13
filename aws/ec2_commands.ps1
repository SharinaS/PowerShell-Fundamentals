# >>>>>>>>>>>>>>>>>> NOTE <<<<<<<<<<<<<<<<<<<<<
# This script is currently not desiged to be run from the command line - 
# it contains PowerShell commands that can be used one at a time,
# depending on the goals in mind.
# >>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<

##########
# Make an EC2 Security Group and Ingress Rules
##########

# Make a security group
New-EC2SecurityGroup -VpcId "vpc-<<your-vpc-id>>" -GroupName "sharina-sg" -GroupDescription "group made from powershell" -ProfileName sandbox -region us-west-2

# Add an Ingress Rule to the security group
# First set up a bunch of variables
$ip1 = new-object Amazon.EC2.Model.IpPermission
$ip1.IpProtocol = "tcp"
$ip1.FromPort = 22
$ip1.ToPort = 22
$ip1.IpRanges.Add("<<11.11.111.11/32>>") # This can be a computer's IP address.

# Then, give the security group ingress rules 
Grant-EC2SecurityGroupIngress -GroupId $securitygroup -IpPermissions @( $ip1 ) -ProfileName sandbox -region us-west-2

# Get Security Group list from a VPC - it's an object
Get-EC2SecurityGroup -Filter @{Name="vpc-id";Values="vpc-0dd8b784a0fd18dc4"}-ProfileName sandbox -region us-west-2

#########
# Search for an AMI
#########

# Search for a Windows AMI
# You'll need to have installed the SimpleSystemsManagement module - see this section's README for the command to use

# Get all the latest windows AMIs
Get-SSMLatestEC2Image -Path ami-windows-latest -region us-west-2

# Narrow the search by looking for particular words in the ImageName
Get-SSMLatestEC2Image -Path ami-windows-latest -ImageName *Windows*2016*English*Full*Base* -region us-west-2

# Once you find the AMI that you want, you can set it to a variable, which returns the AMI id
$latest_windows_ami_id = Get-SSMLatestEC2Image -Path ami-windows-latest -ImageName Windows_Server-2016-English-Full-Base -region us-west-2


##########
# Check on a KeyPair 
##########

# Gets the details of a Key Pair already created in AWS (see resources in README if you need to make a new KeyPair)
# The portion of the optional command, "format-list," simply makes the output more readable
Get-EC2KeyPair -KeyName <<your-key-pair-name>> -region us-west-2 -ProfileName sandbox | format-list KeyName, KeyFingerprint

##########
# Make an Instance
##########

# Use the above collected data to make an EC2 Instance. Note that this instance is bare-bones - it will not have tags nor a name.
New-EC2Instance -ImageId $latest_windows_ami_id -MinCount 1 -MaxCount 1 -KeyName <<your-key-pair-name>> -SecurityGroupId $securitygroup -InstanceType t3.micro -SubnetId subnet-<<your-subnet>> -ProfileName sandbox -region us-west-2 

# Problem: How to get the instance id when the instance is launched -- use the reservation-id?
$instance = Get-EC2Instance -Filter @{Name = "reservation-id"; Values = "r-1233445"}


