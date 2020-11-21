FROM ubuntu

RUN apt-get update && apt-get install -y imagemagick


RUN mkdir -p /photodb/photos

WORKDIR /photodb

ADD script.sh /photodb

COPY photos/* /photodb/photos/

RUN chmod +x script.sh

RUN touch photos/image1.png

ENTRYPOINT ./script.sh && cat index.html
