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

