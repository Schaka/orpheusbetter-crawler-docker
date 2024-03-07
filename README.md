Introduction
------------

orpheusbetter is a script which automatically transcodes and uploads these
files to Orpheus.

The following command will scan through every FLAC you have ever
downloaded or uploaded (if it is in , determine which formats are needed, transcode
the FLAC to each needed format, and upload each format to Orpheus -- automatically.

Please see the original repo for most of the docs.
This one is focused on providing a Docker image of a working version, primarily for myself.

Docker can be started with additional args, such as 
`/app/orpheusbetter --no-upload --threads 4`

Example from Unraid

```
docker run
  -d
  --name='orpheus-better'
  --net='htpc'
  -e TZ="Europe/Berlin"
  -e HOST_OS="Unraid"
  -e HOST_HOSTNAME="HTPC"
  -e HOST_CONTAINERNAME="orpheus-better"
  -l net.unraid.docker.managed=dockerman
  -v '/mnt/user/appdata/orpheus-better':'/config':'rw'
  -v '/mnt/user/share_media':'/data':'rw'
  -v '/mnt/user/appdata/qbittorrent-semi-private/qBittorrent/BT_backup/':'/torrent':'rw' 'schaka/orpheus-better' /app/orpheusbetter
  --no-upload
  --threads 4
```
