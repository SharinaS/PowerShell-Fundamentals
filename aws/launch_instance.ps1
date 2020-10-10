# Get latest ami id and set it to a variable
$latest_windows_ami_id = Get-SSMLatestEC2Image -Path ami-windows-latest -ImageName Windows_Server-2016-English-Full-Base -region us-west-2

# Count # lines (instances) in csv file and set to a variable 
$old_instances = Get-Content -Path instances_sample.csv
$old_instances_number = $old_instances.Count

# Make an empty array of length instance_numb called new_instances_array

# While i is greater than or equal to instance_numb, launch a new instance, store the instane id in the new_instances_array, and reduce count of i by 1. 
# $a = 1,2,3,4,5
# $x = 0
# while ($x -lt $a.Count)
# {
#     #add 5 to the array
#     $a[$x]+ 1
#     $x++    
#     "`$x is now $x"
# }

######################
$latest_windows_ami_id
$old_instances_number
