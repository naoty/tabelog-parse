# tabelog-parse

Parse a page of a restaurant on Tabelog into JSON string.

## Usage

```
$ bin/tabelog-parse http://tabelog.com/tokyo/A1316/A131603/13111869/
{"name":"おにやんま","genre":"うどん、郷土料理（その他）","address":"東京都品川区西五反田1-6-3","mapUrl":"https://www.google.com/maps/embeded/v1/place?key=<KEY>&q=東京都品川区西五反田1-6-3"}
```

`./secrets.yml` like this is required.

```yaml
google_api_key: ...
```
