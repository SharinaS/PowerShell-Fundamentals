##########
# EC2 Security Group
##########

# Make a security group
$securitygroup = New-EC2SecurityGroup -VpcId "vpc-0dd8b784a0fd18dc4" -GroupName "sharina-sg" -GroupDescription "group made from powershell" -ProfileName sandbox -region us-west-2

# Get the security group id (returns the group id if the security group already exists)
$securitygroup

# Add an Ingress Rule to the security group
# First set up a bunch of variables
$ip1 = new-object Amazon.EC2.Model.IpPermission
$ip1.IpProtocol = "tcp"
$ip1.FromPort = 22
$ip1.ToPort = 22
$ip1.IpRanges.Add("<<11.11.111.11/32>>") 

# Then, give the security group ingress rules 
Grant-EC2SecurityGroupIngress -GroupId $securitygroup -IpPermissions @( $ip1 ) -ProfileName sandbox -region us-west-2

#########
# AMI
#########

# Search for the latest Windows AMI
# The query flag allows for grabbing just the Name information out of the JSON that would otherwise be returned.
aws ssm get-parameters-by-path --path "/aws/service/ami-windows-latest/" --region us-west-2 --query "Parameters[*].Name"

# Sort the query to only include Windows_Server-2019-English-Full
aws ssm get-parameters-by-path --path "/aws/service/ami-windows-latest/" --region us-west-2 --query "Parameters[*].Name"|sort-object | select-string -Pattern "/aws/service/ami-windows-latest/Windows_Server-2016-English-Full"

