FROM dorowu/ubuntu-desktop-lxde-vnc:bionic
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
python-rosdep \
build-essential

RUN pip install -U catkin_tools

# Adding keys for ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# # Installing ROS
RUN apt-get update 
# RUN apt-get install -y ros-melodic-desktop-full
# RUN rosdep init
# RUN rosdep update

# RUN /bin/bash -c "echo 'export HOME=/home/ubuntu' >> /root/.bashrc && source /root/.bashrc"

# # Creating ROS_WS
# RUN mkdir -p ~/workspace/src

# # Set up the workspace
# RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && \
#                   cd ~/workspace/ && \
#                   catkin_make && \
#                   echo 'source ~/workspace/devel/setup.bash' >> ~/.bashrc"

# # Updating ROSDEP and installing dependencies
# RUN cd ~/ros_ws && rosdep update && rosdep install --from-paths src --ignore-src --rosdistro=kinetic -y