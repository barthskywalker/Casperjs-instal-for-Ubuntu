#!/bin/bash
#01-06-2017 by Barth O'Keeffe
  ########################################################
  #This script is to install first PhantomJS and all its #
  #dependencies as if doing it manually and then install #
  #CasperJS as if doing it manually as well ***you could #
  #also do this entire process with Node Package Manager#
  #'npm'but at the time of writing this script the npm   #
  #install is buggy and unpredictable *** It will then   #
  #install Slimerjs and xvfb linux graphical engine for  #
  #use with Slimerjs instead of Firefox's Gecko engine   #
  ########################################################

#first make sure system is up todate
sudo apt-get update #&& sudo apt-get upgrade && sudo apt-get autoclean && sudo apt-get autoremove

#install PhantomJS dependencies
sudo apt-get install -y python-software-properties
sudo apt-get install -y build-essential libssl-dev
sudo apt-get install -y curl libc6 libcurl3 zlib1g
sudo apt-get install -y build-essential chrpath libssl-dev libxft-dev
sudo apt-get install -y libfreetype6 libfreetype6-dev
sudo apt-get install -y libfontconfig1 libfontconfig1-dev
sudo apt-get -f install

#install PhantomJS
cd /usr/local/share
sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
sudo tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2
sudo rm -r phantomjs-2.1.1-linux-x86_64.tar.bz2
sudo ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/phantomjs /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/phantomjs /usr/local/bin/phantomjs
sudo ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/phantomjs /usr/bin/phantomjs

#install SlimerJS
while true; do
  echo "Is this install been done on a server? [yn]"
  read -r yn
  case $yn in
    [Yy]* )
    #server install slimerjs needs to be located in home directory in order to have access to .Xauthority file
    cd ~
    sudo wget https://download.slimerjs.org/releases/0.10.3/slimerjs-0.10.3.zip
    sudo unzip slimerjs-0.10.3.zip
    sudo rm -r slimerjs-0.10.3.zip
    sudo ln -s ~/slimerjs-0.10.3/slimerjs /usr/bin/slimerjs
    sudo ln -s ~/slimerjs-0.10.3/slimerjs /usr/local/bin/slimerjs
    sudo ln -s ~/slimerjs-0.10.3/slimerjs /usr/local/share/slimerjs
    break;;

    #local system install
    [Nn]* )
    cd /usr/local/share
    sudo wget https://download.slimerjs.org/releases/0.10.3/slimerjs-0.10.3.zip
    sudo unzip slimerjs-0.10.3.zip
    sudo rm -r slimerjs-0.10.3.zip
    sudo ln -s /usr/local/share/slimerjs-0.10.3/slimerjs /usr/bin/slimerjs
    sudo ln -s /usr/local/share/slimerjs-0.10.3/slimerjs /usr/local/bin/slimerjs
    sudo ln -s /usr/local/share/slimerjs-0.10.3/slimerjs /usr/local/share/slimerjs
    break;;
    * ) echo "Please answer yes or no.";;
  esac
done


#install firefox if not already installed
sudo apt-get install firefox -y
export SLIMERJSLAUNCHER=/usr/bin/firefox/

#install CasperjsJS
cd /usr/local/share
sudo wget https://github.com/casperjs/casperjs/archive/1.1.4-1.zip
sudo unzip 1.1.4-1.zip
sudo rm -r 1.1.4-1.zip
sudo ln -s /usr/local/share/casperjs-1.1.4/bin/casperjs /usr/bin/casperjs
sudo ln -s /usr/local/share/casperjs-1.1.4/bin/casperjs /usr/local/bin/casperjs
sudo ln -s /usr/local/share/casperjs-1.1.4/bin/casperjs /usr/local/share/casperjs

#install xvfb
sudo apt-get install xvfb -y

#tidy up
sudo apt-get update #&& sudo apt-get upgrade && sudo apt-get autoclean && sudo apt-get autoremove

printf '\n\n'
printf 'CasperJs Fully installed on system\n'
casperjs --version
printf '\n\n'
