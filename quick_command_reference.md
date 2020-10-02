|Command|Description of Command|PS Type Tested|
|-----|-----|-----|
|`get-service`|Shows status, name and display name of stuff in computer. |Windows|
|`get-help`|||
|`get-command`|Lists commands you can use | Windows|
|`get-history`|||
|`get-verb` | Gets a list of all the verbs available. You can add a pipe with "more" after the command to give you an easier way to scroll. | Core |
|`get-verb –verb <a verb from the get-verb list>`|Gives you information about a verb | Core|
| `get-verb –group <group name found in get-verb command>` |Gives you all the verbs within a group, such as `security` | Core |
| `get-service –name <>*`| Lists all the services whose name starts with a particular letter or word, for example, `–name p*` |Windows, Core |