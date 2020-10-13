# GET LATEST AMI ID
$latest_windows_ami_id = Get-SSMLatestEC2Image -Path ami-windows-latest -ImageName Windows_Server-2016-English-Full-Base -region us-west-2


# GET INFO FROM CSV FILE
# Count # lines (instances) in csv file and set to a variable 
$old_instances = Get-Content -Path instances_sample.csv
$number_old_instances = $old_instances.Count


# SET UP TAGGING
# instance tagging
$tag1 = @{ Key="createdby"; Value="sharina"}
$tagspec1 = new-object Amazon.EC2.Model.TagSpecification
$tagspec1.ResourceType="instance"
$tagspec1.Tags.Add($tag1)
# volume tagging
$tagspec2 = new-object Amazon.EC2.Model.TagSpecification
$tagspec2.ResourceType="volume"
$tagspec2.Tags.Add($tag1)


# LAUNCH INSTANCE(S) (uses security group id created from "make_security_group.ps1")
New-EC2Instance -ImageId $latest_windows_ami_id  -MinCount 1 -MaxCount 1 -KeyName Sharina-keypair-for-some-amazing-project -SecurityGroupId sg-0109a2e83eef6de64 -InstanceType t3.micro -SubnetId subnet-0744aa1db922d85d4 -TagSpecification $tagspec1,$tagspec2 -ProfileName sandbox -region us-west-2 | add-content -path new_instances.csv
#TODO: Try using a pipe to add the instance id to either a new csv file or an array


$latest_windows_ami_id
# $number_old_instances
# $new_instances_array.length
