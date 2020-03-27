![Image](docs/img/logo.png)

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
Please see the [installation](docs/Installation.md) chapter in the [documentation](https://sahibdhanjal.github.io/butler/) for installing and running the environments

## Contribution Guide
Please see the [contribution](docs/Contribution.md) chapter in the [documentation](https://sahibdhanjal.github.io/butler/) for a basic guide to develop and contribute to this repository.

## Support
Having trouble with the repository? Check out our [documentation](https://sahibdhanjal.github.io/butler/) or [raise an issue](https://github.com/sahibdhanjal/butler/issues) and we’ll help you sort it out.

## References
* [nvidia-docker](https://github.com/NVIDIA/nvidia-docker)
* [ubuntu-vnc-desktop](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc)
* [ROS Melodic](http://wiki.ros.org/melodic)
