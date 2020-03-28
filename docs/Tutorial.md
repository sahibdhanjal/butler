# Tutorial
Assuming you've already built and run the containers as documented in [installation](Installation.md) and are able to see the VNC screen in your browser, go ahead and open a new terminal in the session.
Once you've launched a terminal, you have the following command options:

## Run Simulator
```bash
# this launches the kobuki in both an rViz and Gazebo window
roslaunch butler robot.launch
# OR
roslaunch butler robot.launch robot:=kobuki

# to launch jackal, use the following
roslaunch butler robot.launch robot:=jackal

# to launch the aion r1 rover, use the following
roslaunch butler robot.launch robot:=aion_r1

# you can switch off gazebo and(or) rViz by setting the parameters to false
roslaunch butler robot.launch robot:=aion_r1 gazebo:=false rviz:=false
```


## Download Datasets
We've added a handy script to download most datasets you'd be using in you daily work. You can use the following command to download VOC 2007/2012, COCO 2012/2017, KITTI Odometry, and TUM RGBD datasets: `. scripts/download <dataset>`. For any other dataset that you might need or foresee being used on a daily basis, please add a feature request and someone from the development team will look into it