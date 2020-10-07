# Import CSV
# Use ForEach-Object or a foreach
# Do something

#################
# ForEach-Object
#################

# Import-Csv -Path test-file.csv | ForEach-Object {
#     foreach ($property in $_.PSObject.Properties) 
#     {
#         #Write-Host "$property"
#         #Write-Host $property.Value
#     }
# }

# Piping input into ForEach
# Loop through entire CSV content
# Iterate based on the current object
Import-Csv -Path test-file.csv | ForEach-Object {
    Write-Host $_.Word, $_.Integer
}

 

#################
# foreach 
#################

# statement - foreach at beginning of line
$file = Import-Csv .\test-file.csv
ForEach($content in $file) {
    Write-Host $content.Word, $content.Integer
}

