# HashTables

## HashTables inside of hashTables - Hash table Objects

Make a hashtable with objects:

```powershell
$animals = $animals + @{"mammals"=@{"dogs"=1; "cats"=3;"raccoons"=2}}
```

Add another hashtable within the parent hashtable:

```powershell
$animals = $animals + @{"birds"=@{"sparrows"=7; "crows"=3;"bluejays"=6}}
```

Access one child hashtable:

```powershell
$animals.birds
```

Get just the keys. Or, just the values.

```powershell
$animals.birds.keys
```

Get the value to a particular key, such as the number of sparrows:

```powershell
$animals.birds.sparrows
```

Add a key-value to one of the child hashtables, such as 7 woodpeckers in the bird hashtable, within the animals hashtable:

```powershell
$animals.birds.add("woodpeckers", 12)
```

You should now have the following in your `animals` hashtable:

```powershell
Name                           Value
----                           -----
birds                          {sparrows, bluejays, woodpeckers, crows}
mammals                        {dogs, raccoons, cats}
```
