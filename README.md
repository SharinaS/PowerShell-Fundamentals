# PowerShell-Fundamentals

My collection of cheatsheets, code, notes and resources created while learning PowerShell

[[_TOC_]]

## Index

* [Accessing Data from Computer Hardware](https://github.com/SharinaS/PowerShell-Fundamentals/blob/main/data-gathering.md)
* [Arrays](https://github.com/SharinaS/PowerShell-Fundamentals/blob/main/arrays.md)
* [ArrayObjects](https://github.com/SharinaS/PowerShell-Fundamentals/blob/main/arrays.md)
* [Command Syntax](#Command-Syntax)
* [Iterate Over CSV Files](https://github.com/SharinaS/PowerShell-Fundamentals/tree/main/iterate-over-csv-files)
* [Objects](#Objects)
* [Positional Parameters](#Positional-Parameters)
* [PowerShell for AWS](#PowerShell-for-AWS)
* [Quick Command Reference](https://github.com/SharinaS/PowerShell-Fundamentals/blob/main/quick_command_reference.md)
* [Read Files](https://github.com/SharinaS/PowerShell-Fundamentals/tree/main/read-write-files)
* [Search For A Command to Do Something](#Search-For-A-Command-to-Do-Something)
* [Types of PowerShell](#Types-of-PowerShell)

## Types of PowerShell

Powershell core – newer. Does not come with Windows by default. Can do nearly all the same stuff. Allows us to run commands on multiple platforms, unlike Powershell. Based on .netcore. Downloadable from GitHub. Can be run on Windows, Linux and MacOS. The future way of working with PS. An open source project. Only has a subset of Windows PS commands, but it’s a large subset. To open in computer, can type “pwsh"

Windows Powershell ISE – integrated scripting engine. The original built in editor for editing PS scripts. Comes installed by default.  

Windows Powershell - most popular. Built into Windows. Only on windows; can’t install or run on mac or linux. Based on the .net standard, using the .net framework that PS is built on. Development has stopped for Windows Powershell (no further updates, except for security stuff). 

## Objects

PowerShell treats all data as objects.

Can be both text based and objects based.

PS commands use objects as their output, which is helpful, since objects properties and methods.

Used with pipes, the object that is outputted from one command is passed to the next command.

```powershell
Get-Service|Select-Object name,starttype,servicetype|more
```

## Command Syntax

Verb-Noun – all commands should be formated this way. 

Parameters – used to pass info into the command. All prefixed with a “-”.

### Positional Parameters

It expects in the first position that the "name" parameter will appear. This means that you can shorten commands for named parameters.

Instead of:

```powershell
get-service -name p*
```

You can simply write:

```powershell
get-service p*
```

Or, if you're also using Aliases:

```powershell
gsv p*
```

### Aliases

Helpful when testing small stuff. Avoid using in your scripts.

## Search For A Command to Do Something

Example: Say, you're looking for runtime dynamic data, particularly a runtime performance counter.

Do a general search for commands that have the word counter in them, with wildcards around the word to indicate that the word can be at the beginning, middle or end of a command.

```powershell
get-command *counter*
```

check help for the one that looks promising.

```powershell
help get-counter
```

Look at the Syntax section for flags to use.

Try the main command

MORE CONTENT PENDING

## Loops

### While Loops

See PowerShell file titled while-loops.ps1 for examples.


## Resources

* Udemy course – "Windows PowerShell in less than 2 hours – 15 hands on demos," taken in October 2020.
* [The Big Book of PowerShell Gotchas](https://devops-collective-inc.gitbook.io/the-big-book-of-powershell-gotchas/)
* [PowerShell and while loops](https://devblogs.microsoft.com/scripting/powershell-looping-using-while/)
