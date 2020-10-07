# Get the raw content of the file, ie a single string
$raw = Get-Content -Path cosmos.txt -Raw

# Get the file contents
$lines = Get-Content -Path cosmos.txt

# use filter to get content inside of any txt file in the read-write-files directory
$alltxtcontent = Get-Content -Path ..\read-write-files\* -Filter *.txt

# count the number of times the word "wood" appears in the files - looks at all the files at the level the script is run at.
# $searchforblue = 'wood', 'Wood' | Select-String -Pattern 'Wood' -CaseSensitive -SimpleMatch
$searchforblue = 'Wood' | Select-String -Pattern 'wood'

# search a particular file for a particular string pattern - produces the line that pattern is found in, and the line #.  
$searchafile = Select-String -Path .\schooner.txt -Pattern 'EUR'



###################
# PRINT TO CONSOLE
###################
Write-Host "Raw version contains $($raw.Count) lines. \
Lines version contains $($lines.Count) lines. \
Everything from all the txt files: $($alltxtcontent)"
Write-Host $searchforblue
Write-Host $searchafile

