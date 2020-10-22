# Hashmaps

## Make a Hashmap

## Hashmaps inside of hashmaps

Make a hashmap:

```powershell
$animals = $animals + @{"mammals"=@{"dogs"=1; "cats"=3;"raccoons"=2}}
```

Add another hashmap within the parent hashmap:

```powershell
$animals = $animals + @{"birds"=@{"sparrows"=7; "crows"=3;"bluejays"=6}}
```

Access one child hashmap:

```powershell
$animals.birds
```

Get just the keys. Or, just the values.

```powershell
$animals.birds.keys
```

Add a key-value to one of the child hashmaps:

```powershell
$animals.birds.add("woodpeckers", 12)
```

You should now have the hashmaps, birds and mammals, inside your animals hashmap.

```powershell
Name                           Value
----                           -----
birds                          {sparrows, bluejays, woodpeckers, crows}
mammals                        {dogs, raccoons, cats}
```
