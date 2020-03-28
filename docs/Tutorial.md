# Tutorial
Assuming you've already built and run the containers as documented in [installation](Installation.md) and are able to see the VNC screen in your browser, go ahead and open a new terminal in the session.
Once you've launched a terminal, you have the following command options:

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