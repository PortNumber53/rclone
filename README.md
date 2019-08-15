# rclone
So I can run rclone in a container


# Usage:

## List remotes:
```
docker run -it --rm -v ~/:/config  portnumber53/rclone listremotes
```

## List contents of a remote/path:
```
docker run -it --rm -v ~/:/config  portnumber53/rclone ls YOURREMOTE:/PATH
```

## Sync something

```
docker run -it --rm -v ~/:/config -v LOCAL_FOLDER_YOU_WANT_SYNC/:/FOLDER_INSIDE_CONTAINER portnumber53/rclone copy /FOLDER_INSIDE_CONTAINER/ YOURREMOTE:/PATH -P --fast-list --log-level=DEBUG --transfers=2 --tpslimit=2
```
