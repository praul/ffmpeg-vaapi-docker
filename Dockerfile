FROM ubuntu:jammy

WORKDIR /app
COPY ./app/*  /app

RUN apt update && apt install -y ffmpeg mesa-va-drivers libgl1-mesa-glx libgl1-mesa-dri
RUN mkdir /convert && mkdir /convert/source && mkdir /convert/output && mkdir /convert/done && chmod -R 777 /convert


CMD ["bash","/app/convert.sh"]
