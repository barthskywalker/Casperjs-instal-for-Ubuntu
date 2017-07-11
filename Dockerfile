FROM ubuntu:latest
MAINTAINER Barth O'Keeffe (barthskywalker@gmail.com)
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get upgrade -y
RUN apt-get install -y git
RUN apt-get install -y build-essential libssl-dev
RUN apt-get install -y unzip
RUN apt-get install -y wget
RUN apt-get install -y npm

