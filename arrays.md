# Arrays

Arrays are immutable. There are three types - default, strongly typed, and ArrayList

## Create a Default Array

Type: [PSObject[]]. Holds any type of data value.

```powershell
$arr = @("cats", "dogs", "parrots")
```

Or, long-hand is to define what type of array it is:

```powershell
[PSObject[]] $kitchen = 'apples', 'silverware', 18
```

## List its contents

```powershell
$arr
```

Prints items in the array like so:

```powershell
cats
dogs
parrots
```

Number of objects in the array - called `arr` - is 3:

```powershell
$arr|Measure-Object  
```

Or, simply use .count, which is within Measure-Object:

```powershell
$arr.count 
```

## Array Operators

### Check for whether something exists in the array

```powershell
$arr -contains <item to look for>
```

Returns a boolean.

### Smush the objects together

Original array is unchanged; output is a single object, whose itmes are separated by what you tell them to be joined by.

#### Return a single object with spaces and commas between the strings ("cats, dogs, parrots")

```powershell
$arr -join ", "
```

Prove this with:

```powershell
$arr -join ", "|Measure-Object  
```

### Return the object that you're looking for

Checks for equality, but unlike contains, will return the item if it exists.

```powershell
$arr -eq "parrot"
```

If the object doesn't exist, it won't return a thing.

Use `ne` to return the items that are not equal to what you're looking for.

## Combine Arrays with "Concatenate" and "Plus Equals"

My sample set (not instantiated in PS style)

* animals = ["cats", "dogs", "horses"]
* dolphins = ["bottlenose", "white-sided"]

### Concatenate arrays

The second array is appended to the first.

Six objects are printed out:

```powershell
$animas+$dolphins
```

### Plus Equals

Command copies the values from the array and makes a new array that also includes the new value(s)

## Strongly Typed Arrays

Available for using when you only want a specific data type in the array. 

For example, integers only:

```powershell
[int[]] $ages = 4, 36, 47
```

Or, strings only:

```powershell
[string[]] $flowers = "daffodil", "roses", "bleeding heart"
```

## Resources

* [Varonis Powershell Blog](varonis.com/blog/powershell-array)