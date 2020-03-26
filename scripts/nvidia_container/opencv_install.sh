ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
DEBIAN_FRONTEND=noninteractive \
apt-get update &&\
apt-get install -y \
libopencv-dev