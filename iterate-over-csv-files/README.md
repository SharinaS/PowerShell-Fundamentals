# Iterate Over a CSV File

## Iteration Options

### foreach

An alias of `ForEach-Object`

Syntax:

```powershell
foreach ($<item> in $<collection>){
    <statement list>
}
```

The Variable "item" is created automatically. 


### ForEach-Object

Performs an operation on each item in a collection of input objects. Objects can then be piped or used with `InputObject` parameter.

`$_` specifies the current object

Use with `$PSItem` or `$_`.

(What happens if the stream gets broken?)

### Comparison

||`foreach` statement|`ForEach-Object` cmdlet|
|-----|----|----|
|Object processing|Allocates everything to memory before processing|Items are streamed via the pipeline to then be processed. Objects are processed one at a time.|
|Memory|Requires more memory, might run out of memory for lots of data before processing|Lower memory requirements b/c of streaming of data|
|Performance|Best performance (script block is not invoked each time)|Worse performance|
|||Gives Begin, Prcoess and end blocks|
|Item count|When you don't know the total count of processed items, get the complete list then use the foreach-loop||
||||


## CSV File

`Import-Csv`: The csv columns turn into properties of the custom object, and the rows become property values.


## Resources

* [Examples on for each loops and csv files](https://adamtheautomator.com/powershell-import-csv-foreach/)
* [ForEach vs ForEach-Object](https://devblogs.microsoft.com/scripting/getting-to-know-foreach-and-foreach-object/)