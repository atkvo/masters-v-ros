#!/bin/bash

echo "Setting up ROS environment"

# echo "Initializing rosdep..."
# rosdep init
# rosdep update

echo "Environment setup"

echo "source /opt/ros/kinetic/setup.bash" >> /home/ubuntu/.bashrc
source ~/.bashrc

echo "Installing rosinstall"

apt-get install python-rosinstall -y

echo "ROS setup complete"
