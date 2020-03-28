![Image](docs/img/logo.png)

# Butler : A framework for Visual/Sparse-SLAM based Mobile Robots
[![Travis CI Status](https://travis-ci.com/sahibdhanjal/butler.svg?token=sv3o6a8nfkBezqZhmnpy&branch=master)](https://travis-ci.com/sahibdhanjal/butler)
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
Please see the [installation](docs/Installation.md) chapter in the [documentation](https://sahibdhanjal.github.io/butler/) for installing and running the environments.

## Quick Run
For a quick test run of butler, you can follow these steps after building the ROS/Gazebo container as listed in [installation](docs/Installation.md). Once you've built the container, run it using `. run ros`. This will start a VNC session in your browser at [localhost:6080](http://localhost:6080/). Open a new terminal in that VNC session `Home > System Tools > LX Terminal` and type in `roslaunch butler robot.launch` and voila, you should be able to see the small Kobuki robot in it. For a more detailed run through, please see the [tutorial](docs/Tutorial.md) chapter in the [documentation](https://sahibdhanjal.github.io/butler/).

## Contribution Guide
Please see the [contribution](docs/Contribution.md) chapter in the [documentation](https://sahibdhanjal.github.io/butler/) for a basic guide to develop and contribute to this repository.

## Support
Having trouble with the repository? Check out our [documentation](https://sahibdhanjal.github.io/butler/) or [raise an issue](https://github.com/sahibdhanjal/butler/issues) and we’ll help you sort it out.

## References
* [nvidia-docker](https://github.com/NVIDIA/nvidia-docker)
* [ubuntu-vnc-desktop](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc)
* [ROS Melodic](http://wiki.ros.org/melodic)
* [ROS Jackal](http://wiki.ros.org/jackal_description)
* [ROS Kobuki](https://github.com/yujinrobot/kobuki)
* [ROS AION R1](https://github.com/aionrobotics)
