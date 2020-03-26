<p align="center"><img src="docs/img/logo.png" width=100%></p>


# Butler : A framework for Visual/Sparse-SLAM based Mobile Robots
[![Buildkite CI Status](https://app.wercker.com/status/8b02a43f48216385658bb3857aae5fd8/s/master)](https://travis-ci.org/xdspacelab/openvslam)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/shinsumicco/openvslam.svg)](https://hub.docker.com/r/shinsumicco/openvslam)
[![License](https://img.shields.io/badge/license-GPLv3-orange)](https://opensource.org/licenses/GPL-3.0)

## Overview
Butler is a platform independent framework for mobile robotics, deep learning and simulated algorithms for small UGVs and differential drive robots (such as [Kobuki](http://kobuki.yujinrobot.com/about2/) and [Jackal](https://clearpathrobotics.com/jackal-small-unmanned-ground-vehicle/)). The repository supports an array of algorithms aiming at mapping, localization, perception, and control in a variety of simulated environments.

## Requirements
The minimum requirements to get started with Butler are:
* **OS** : Ubuntu 16.04+, Windows 7+, Mac OS 
* **Browser** : Google Chrome, Firefox
* **Docker**

Deep Learning Dependencies (_optional_):
* **Nvidia GPU**
* **Nvidia Driver 418+**

## Installation
If on Ubuntu or Mac OS, proceed as follows:
* clone the repository - `git clone https://github.com/sahibdhanjal/butler.git`
* install basic system dependencies - `. scripts/provision install`
* build the ROS/Gazebo docker container - `. scripts/provision build ros`
* build the nvidia docker container (_optional_) - `. scripts/provision build nvidia`

If on Windows, proceed as follows:
* clone the repository - `git clone https://github.com/sahibdhanjal/butler.git`
* install [git](https://git-scm.com/download/win), [docker](https://docs.docker.com/docker-for-windows/install/), [google chrome](https://www.google.com/chrome/) and the latest [nvidia](https://www.nvidia.com/Download/index.aspx) driver supported by your card
* build the ROS/Gazebo docker container - `docker build scripts/ros_container -t butler-ros:latest`
* build the nvidia docker container (_optional_) - `docker build scripts/nvidia_container -t butler-nvidia:latest`

## Tutorial
Run the **ROS container** using `. run ros`, which automatically starts a session in your web browser at [localhost:6080](http://localhost:6080/). You can now use this browser tab to visualize whatever you want to run. Your local folder is directly mapped to the folder in the docker container, so any change you make will automatically reflect there. 

Run the **nvidia container** using `. run nvidia`, which opens up a terminal inside the docker itself. An optimized version of cuda and pytorch have been setup inside this environment and it is highly suggested to use the environment inside for any testing, training, inference purposes.

## Contribution Guide
We follow the [Google Coding Standard](https://google.github.io/styleguide/cppguide.html) for C/C++/Protobuf and [PEP8](https://www.python.org/dev/peps/pep-0008/) for Python development. Linters are already in place to ensure developer efficiency. To setup your environment, please run - `. scripts/provision develop`

## Support

Having trouble with the repository? Check out our [documentation](https://sahibdhanjal.github.io/butler/) or [raise an issue](https://github.com/sahibdhanjal/butler/issues) and we’ll help you sort it out.
