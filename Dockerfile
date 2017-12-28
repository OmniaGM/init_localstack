#*************************************#
#EDITME: THIS IS PLACEHOLDER FOR YOUR APP
#*************************************#
FROM ubuntu:17.10 
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y python-pip
RUN pip install awscli


CMD ["/bin/bash"]

#******************************#
#END OF PLACEHOLDER FOR YOUR APP
#******************************#
