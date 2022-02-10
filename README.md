# ffmpeg-vaapi-docker
Autmatic transcoding of files in watched folder with vaapi / gpu support

This is a very simple docker image that watches a folder for files and tries to transcode them. 

1. Clone repo and enter folder
2. Build the image: `docker build -t praul/ffmpeg .`
3. Create a convert dir somewhere and change docker-compose.yml accordingly. The folder has to be mounted inside the container at `/convert`
4. Start a container with docker-compose: `docker-compose up -d`
5. Put files in your convert/source folder. They will be transcoded.
6. If you want to change the ffmpeg settings, change app/convert.sh and mount it in the container to `/app/convert.sh`
7. Default convert settings are 2M Bitrate, HEVC

## docker-compose
**recommended
```
version: '3.3'
services:
  ffmpeg:
    image: praul/ffmpeg
    container_name: ffmpeg
    environment:
      - PUID=1000
      - PGID=100
      - TZ=Europe/Berlin
    volumes:
      - './app/:/app' #you can mount your own /app/convert.sh to change / adjust ffmpeg settings
      - './convert:/convert' # mount a folder to /convert. Place your files in convert/source. They will be transcoded to convert/output and the source file will be moved to convert/done
    group_add:
      - 44  #these have to be the video groups on your docker host
      - 100
  
    devices:
      - /dev/dri/renderD128:/dev/dri/renderD128`#your render device
```
