FROM dorowu/ubuntu-desktop-lxde-vnc
LABEL maintainer "dhanjalsahib@gmail.com"

# Install basics
RUN apt-get update && apt-get install -y \
apt-utils \
dirmngr \
wget \
git \
nano \
vim \
python-dev \
python-pip \
python3-dev \
python3-pip \
terminator

RUN pip install -U catkin_tools

# Adding keys for ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update 

# Installing ROS
RUN apt-get install -f -y \
python-catkin-pkg-modules \
python-rosdistro-modules \
python-rospkg-modules \
ros-melodic-desktop-full \
python-rosdep \
python-rosinstall \
python-rosinstall-generator \
python-wstool

RUN rosdep init
RUN rosdep update

# Creating ROS_WS
RUN mkdir -p ~/workspace/src

# Set up bashrc
RUN /bin/bash -c "echo 'source /opt/ros/melodic/setup.bash' >> /root/.bashrc  && source /root/.bashrc"
RUN /bin/bash -c "echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc  && source ~/.bashrc"

# Set up the ROS workspace
RUN /bin/bash -c "echo 'export HOME=/home/workspace/src/butler' >> /root/.bashrc && source /root/.bashrc"
RUN /bin/bash -c "cd /home/workspace/ && \
                  catkin_make && \
                  echo 'source ~/workspace/devel/setup.bash' >> ~/.bashrc"
