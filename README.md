# ffmpeg-vaapi-docker
Autmatic transcoding of files in watched folder with vaapi / gpu support

This is a very simple docker image that watches a folder for files and tries to transcode them. 

1. Clone repo and enter folder
2. Build the image: `docker build -t praul/ffmpeg .`
3. Create a convert dir somewhere and change docker-compose.yml accordingly. The folder has to be mounted inside the container at `/convert`
4. Start a container with docker-compose: `docker-compose up -d`
5. Put files in your convert/source folder. They will be transcoded.
6. If you want to change the ffmpeg settings, change app/convert.sh and mount it in the container to `/app/convert.sh`

