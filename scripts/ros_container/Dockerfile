FROM dorowu/ubuntu-desktop-lxde-vnc
LABEL maintainer "dhanjalsahib@gmail.com"

# Install basics
RUN apt-get update && apt-get install -y \
apt-utils \
dirmngr \
curl \
cmake \
wget \
git \
nano \
vim \
python-dev \
python-pip \
python3-dev \
python3-pip \
terminator \
libeigen3-dev \
libgtest-dev \
libgoogle-glog-dev \
libboost-dev \
libyaml-cpp-dev

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

# Installing OpenCV
COPY opencv_install.sh $WORKPATH/
RUN bash $WORKPATH/opencv_install.sh

# Build GTest
RUN /bin/bash -c "cd /usr/src/gtest && \
                  cmake CMakeLists.txt && \
                  make && \
                  cp *.a /usr/lib"


# Install ROS plugins/packages
RUN apt-get install -f -y \
ros-melodic-hector-* \
ros-melodic-velodyne

# Set up bashrc and workspace
RUN /bin/bash -c "echo 'source /opt/ros/melodic/setup.bash' >> /root/.bashrc && \
                  echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc && \
                  source ~/.bashrc && \
                  mkdir -p ~/workspace/src && \
                  cd ~/workspace/ && \
                  catkin_make && \
                  echo 'source ~/workspace/devel/setup.bash' >> ~/.bashrc && \
                  echo 'source /home/ubuntu/workspace/devel/setup.bash' >> /root/.bashrc && \
                  echo 'cd /home/ubuntu/workspace/' >> /root/.bashrc"
