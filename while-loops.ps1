# basic while loop 

$a = 1,2,3,4,5
$x = 0
while ($x -lt $a.Count)
{
    #add 5 to the array
    $a[$x]+ 1
    $x++    
    "`$x is now $x"
}