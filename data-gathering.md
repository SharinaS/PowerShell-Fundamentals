# Accessing Data from Computer Hardware

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
