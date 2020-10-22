# Using PowerShell To Get Info About Computer

## Accessing Data from Computer Hardware

Use Common Information Model (CIM, pronounced "sim") to access information about computer hardware. Windows Management Instrumentation (WMI) was developed to reveal information about computer hardware, but it is no longer being maintained.

Unlike WMI, you can use Powershell Core to access information when using CIM.

Bring back list of all CIM objects - all hardware abstraction class we have access to. See all the classes and classnames we can work with, in other words: 

```powershell
Get-Cimclass -class *
```

Check the computer memory

```powershell
Get-CimClass -classname *memory*
```

```powershell
Get-CimClass -classname *physical*memory*
```

Closer look at the CIM_PhysicalMemory class. Note, you have to use Windows Powershell to run this command; Core won't know what you're talking about. 

```powershell
Get-WMIObject -classn CIM_PhysicalMemory
```

Identify the amount of physical memory on your computer:

```powershell
Get-WMIObject -class CIM_PhysicalMemory|select-object tag,capacity
```

## Performance Counters

Search for a counter command: 

```powershell
get-command *counter*
```

Notice that `memory` stuff is pulled up with:

```powershell
get-counter
```

Use `list-set` to see more, with and without the wildcards, `*`.

```powershell
get-counter -listset *memory*
```

The output is truncated, so if piping the command into `select-object counter` doesn't work (`get-counter -listset memory|select-object counter`), use the `-expand` command:

```powershell
get-counter -listset memory|select-object -expand counter
```

Get the data about a specific memory counter by copy/pasting one of the output strings:

```powershell
get-counter -counter "\Memory\Available Bytes"
```

## Get Computer Info - Easier Way to Grab Computer Data!

Using `Get-ComputerInfo` means you don't need CIM and WMI.

Shows the syntax (and that it uses `-property`):

```powershell
help get-computerinfo
```

Get the 8 properties related to memory:

```powershell
help get-computerinfo -property *memory*
```

## Get Info from OS Event Logs

There's an event that is logged as a number for everything that happens, like a user login, or restart, etc. 

If you're not sure where to start, use wildcards:

```powershell
get-command *event*
```

Look at examples for the cmdlet, `Get-EventLog` to see if this will be a helpful command (*Not Available on PowerShell Core*), and definitely check syntax:

```powershell
help get-computerinfo
```

Try getting the last 10 events in the eventlog:

```powershell
get-eventlog -logname system -newest 10
```

Get a list of all output properties available for the object with a pipe and `Get-Member`. Note that each output has an EventId, at the bottom of the Name column.

```powershell
get-eventlog -logname system -newest 10 | get-member
```

Filter based on the property `EventId` with a `Where-Object` command (get the last 5000 logs where the object is is equal to 1074)

* The dollar-underscore references the current object in the pipeline.
* 1074 is the eventid for a restart event (eventid's are specific to event types)

```powershell
get-eventlog -logname system -newest 5000 | where-object {$_.eventid -eq 1074}
```

## Get DNS Info - Networking

Check if the computer is connected to a valid DNS server (for example, the computer is unable to connect to a website):

```powershell
get-dnsclientserveraddress
```

## Resources

* Udemy class - "Windows PowerShell in less than 2 hours - 15 hands on demos!"
