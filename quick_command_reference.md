# Quick Reference 

|Command|Description of Command|PS Type Tested|
|-----|-----|-----|
| `Get-Service` | Shows status, name and display name of stuff in computer. |Windows|
| `Get-Help` |Provides help manual for a specific command, for example, `Get-Help Get-Service` ||
| `Get-Command` | Lists commands you can use. | Windows, Core|
| `Get-History` |||
| `Get-Verb` | Gets a list of all the verbs available. You can add a pipe with "more" after the command to give you an easier way to scroll. | Core |
| `Get-Verb –verb <a verb from the get-verb list>`| Gives you information about a verb | Core|
| `Get-Verb –group <group name found in get-verb command>` | Gives you all the verbs within a group, such as `security` | Core |
| `Get-Service –name <>*`| Lists all the services whose name starts with a particular letter or word, for example, `–name p*`, or `-name p*, r*` | Windows, Core |
| `Get-Alias`|All aliases available (shortened command; don't use in your scripts though), such as `Get-Alias -definition *service*` to check the definition of a service | Core |
| `Measure-Object` | Use after a pipe to count the number of objects from the prior command. Use for checking number of lines or words in a text file, or checking string size, etc | Core|
| `Get-History` | Prints the commands you've recently used. |Core|
| `Clear-History` | Deletes your recent ps history ||
| `Start-Transcript` | Makes a record of a PS session, and puts it all into a text file - both command line and output. Also records errors. You start and stop the transcription process. ||
| `Stop-Transcript` | Stops the transcription process after recording the commands and output into a text file. ||
| `Get-Member` | Gets properties and methods for a specific object. Use it with a pipe, with the command you're curious about prior to the pipe. ||
| `Select-Object` | Highlights chosen properties of an object or set of objects to view, including even objects in an array | Core |
 
## Get-Command Examples

Looks for commands that have the verb "Get" and the noun "storage"

```powershell
Get-Command -verb Get -noun *storage*
```

Filter by name and also by command type

```powershell
Get-Command -name *net* -CommandType Function
```

Use more to specify how you want it to print out

```powershell
Get-Command | more
```

Search for a command that has ip somewhere in it

```powershell
Get-Command -name *ip* -Module *tcpip*
```

## Get-Help Samples

Find help regarding commands related to "service"

```powershell
Get-Help *service*
```

Or, use an alias:

```powershell
help Get-Service
```

See examples on how to use the command

```powershell
Get-Help Get-Command -examples
```

Check how to use measure-object command. Tack on `-examples` see see a great list of things to try.

```powershell
Get-Help measure-object
```

## Get-History Samples

Invoke-History allows you to refer to an ID in the history list (seen when you use the command, `Get-History`) and re-invoke that command. `Invoke-History` is found under "Related Links," seen when you type `Get-History`.

For example, to use the command listed as id 6, after using the command `Get-History`, you'd use the following:

```powershell
Invoke-History -id 6
```

Use a pipe to send the contents of the command out to a txt file. Note that the file is saved at the directory level your powershell is working in.

```powershell
Get-History|out-file my-history.txt
```

## Transcript Samples - Start and Stop

Great for tracking your work, or for troubleshooting errors.

Run each of the following one at a time, which leads to the command and output from the middle command to be written to a text file at the directory level you are running the commands in.

```powershell
Start-Transcript
Get-Help measure-object
Stop-Transcript
```

## Get-Member and Select-Object Examples

Show the methods and properties inherent in the `Get-Service` command:

```powershell
Get-Service|Get-Member
```

See the fun examples Select-Object has:

```powershell
help Select-Object -examples
```

Make the Get-Service command show information about specific properties (instead of the default ones it usually shows)

```powershell
Get-Service|Select-Object name,starttype,servicetype
```


