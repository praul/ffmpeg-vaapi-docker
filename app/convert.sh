#/bin/bash
mkdir /convert/source
mkdir /convert/output
mkdir /convert/done

chmod -R 777 /convert

cd /convert/source

while true
do
  if [ -n "$(ls -A 2>/dev/null)" ]
  then
    for i in *.*;
    do name=`echo "${i%.*}"`;
      echo "Converting $name"
      echo "File $i"
      #ffmpeg -hwaccel vaapi -hwaccel_output_format vaapi -hwaccel_device /dev/dri/renderD128 -i "$i" -vf hwupload -b:v 2M  -c:v h264_vaapi "/convert/output/${name}_h264.mkv"
      ffmpeg -hwaccel vaapi -hwaccel_output_format vaapi -hwaccel_device /dev/dri/renderD128 -i "$i" -vf hwupload -b:v 2M -c:v hevc_vaapi "/convert/output/${name}_hevc.mkv"
      mv "$i" "/convert/done/${i}"
    done
  else
    echo "empty (or does not exist)"
  fi
  sleep 5
done
