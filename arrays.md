# Arrays

Arrays are immutable. There are three types - default, strongly typed, and ArrayList

## Create a Default Array

Type: [PSObject[]]. Holds any type of data value.

```powershell
$arr = @("cats", "dogs", "parrots")
```

Even easier, is to skip the `@` sign:

```powershell
$arr = ("cats", "dogs", "parrots")
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

My sample arrays:

```powershell
$animals = ('cats', 'dogs', 'horses')
$dolphins = ('bottlenose', 'white-sided')
```

### Concatenate arrays

The second array is appended to the first.

Six objects are printed out:

```powershell
$animals+$dolphins
```

### Plus Equals

The `+=` command copies the values from the array and makes a brand new array, that includes the old and the new value(s):

Add "mice" to the animals array:

```powershell
$animals+= 'mice'
```

Add the dolphins array to the animals array (keeps the original dolphin array but deletes and replaces the original animals array):

```powershell
$animals+= $dolphins
```


Note that the old array is deleted.

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

## ArrayLists

A collection - uses the .Net framework. May not be used as much in more complex code.

## ArrayObjects

### Make an array of objects.

This uses the `@()` function.

```powershell
$shoes = @(
[pscustomobject]@{Color='blue'; Type='boots'}
[pscustomobject]@{Color='brown'; Type='heels'}
[pscustomobject]@{Color='black'; Type='neoprene booties'}
)
```

When you access the array of objects, with `$shoes`, you get:

```powershell
Color Type
----- ----
blue  boots
brown heels
black neoprene booties
```

### Get a property

To access only a particular property of an object in the array, such as "heels:"

```powershell
$shoes[1].Type
```

### Update a property

Update the "Type" from "heels" to "sandals:"

```powershell
$shoes[1].Type = 'sandals'
```

### Get all the properties in the array of objects

Iterate through in a PowerShell friendly way:

```powershell
$shoes.Type
```

## Resources

* [Varonis Powershell Blog](varonis.com/blog/powershell-array/#add-values)