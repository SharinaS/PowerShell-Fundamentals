# PowerShell-Fundamentals

My collection of cheatsheets, code, notes and resources created while learning PowerShell

## Types of PowerShell

Powershell core – newer. Does not come with Windows by default. Can do nearly all the same stuff. Allows us to run commands on multiple platforms, unlike Powershell. Based on .netcore. Downloadable from GitHub. Can be run on Windows, Linux and MacOS. The future way of working with PS. An open source project. Only has a subset of Windows PS commands, but it’s a large subset. To open in computer, can type “pwsh 

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


## Resources

* Udemy course – "Windows PowerShell in less than 2 hours – 15 hands on demos," taken in October 2020.
