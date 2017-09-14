FROM ubuntu:latest
MAINTAINER Barth O Keeffe (barthskywalker@gmail.com)
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    apt-utils \
    git \
    unzip \
    wget \
    python-software-properties
####################################################################
######             Install for nodeJS & npm          ###############
####################################################################
RUN apt-get install -y build-essential libssl-dev \
    npm \
    curl libc6 libcurl3 zlib1g
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
RUN apt-get install -y nodejs
####################################################################
##########          Install for phantomJS            ###############
####################################################################
RUN apt-get install -y build-essential chrpath libssl-dev libxft-dev \
    libfreetype6 libfreetype6-dev \
    libfontconfig1 libfontconfig1-dev
RUN cd /opt \
 && wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
 && tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 
RUN ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs
#####################################################################
##########        Install for firefox nightly         ###############
#####################################################################
RUN apt-get install -y libgtk-3-0 libdbus-glib-1-2 libx11-xcb1 libxt6
RUN cd /opt \
    && wget https://download-origin.cdn.mozilla.net/pub/firefox/releases/55.0b4/linux-x86_64/en-GB/firefox-55.0b4.tar.bz2 \
    && tar xjf firefox-55.0b4.tar.bz2 
RUN ln -s /opt/firefox/firefox /usr/bin/firefox
#####################################################################
######               Install for SlimerJS            ###############
#####################################################################
RUN cd /opt \
    && wget https://download.slimerjs.org/releases/0.10.3/slimerjs-0.10.3.zip \
    && unzip slimerjs-0.10.3.zip
RUN ln -s /opt/slimerjs-0.10.3/slimerjs /usr/bin/slimerjs 
RUN printf "[App] \nVendor=Innophi\nName=SlimerJS\nVersion=0.10.3\nBuildID=20170309\nID=slimerjs@slimerjs.org\nCopyright=Copyright 2012-2017 Laurent Jouanneau & Innophi\n\n[Gecko]\nMinVersion=38.0.0\nMaxVersion=55.*\n\n[XRE]" > '/opt/slimerjs-0.10.3/application.ini'
####################################################################
######               Install for CasperJS            ###############
####################################################################
RUN npm install casperjs -g
####################################################################
######              set slimerjs appiclation lancher        ########
####################################################################
RUN export SLIMERJSLAUNCHER=/usr/bin/firefox/
