# AWS and PowerShell

## Prerequisites

Using PowerShell to interact with AWS - to build, modify and delete resources - requires installing and using AWS Tools.

You will also need an AWS account. I already had the AWS CLI setup, so the following instructions is based on having a profile set up prior to setting up PowerShell to interact with AWS.

## PowerShell for AWS

For complete info on setting up PowerShell to interact with your AWS account, see the User Guide for setting up [AWS Tools for PowerShell](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up-linux-mac.html).

The following are the steps I took on a MacBook Pro with MacOS Catalina, with PowerShell Core and AWS CLI already installed and configured.

### Install the AWS Tools Installer

First, you install the modularized AWS.Tools package, which will in the next step let you install the module for whatever service you'd like to access.

```powershell
Install-Module -Name AWS.Tools.Installer
```

### Get the modules for the services you'll be working with

I will be working with EC2 and S3, so I ran the following command:

```powershell
Install-AWSToolsModule AWS.Tools.EC2, AWS.Tools.S3 -CleanUp
```

### Test the connection

If you have an AWS profile that is not set as default, you will need to use the flag `-ProfileName`, like I do.

List out all the S3 buckets in your AWS account:

```powershell
Get-S3Bucket -ProfileName <<Your AWS Profile>>
```

## Resources

