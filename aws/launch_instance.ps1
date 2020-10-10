# Get latest ami id and set it to a variable
$latest_windows_ami_id = Get-SSMLatestEC2Image -Path ami-windows-latest -ImageName Windows_Server-2016-English-Full-Base -region us-west-2

# Count # lines (instances) in csv file and set to a variable 
$old_instances = Get-Content -Path instances_sample.csv
$number_old_instances = $old_instances.Count

# Make an empty array of length instance_numb called new_instances_array, which will soon hold the new instance ids.
$new_instances_array = New-Object string[] $number_old_instances
# alternatively, if a regular PS is desired, can do this: $arr = @($null) * $number_old_instances

$i = $number_old_instances
# While i is greater than or equal to instance_number,
while ($i -ge 0)
{
    #launch a new instance
    #store the instance id in the new_instances_array
    #and reduce count of i by 1
    $x--   
}

######################
$latest_windows_ami_id
$number_old_instances
$new_instances_array.length
