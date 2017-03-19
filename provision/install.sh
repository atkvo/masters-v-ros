#!/bin/bash

echo "Setting up sources list"

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

echo "Setting up keys"

apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

apt-get update -y

apt install g++

echo "Installing Ubuntu desktop"
apt-get install --no-install-recommends ubuntu-desktop -y
apt-get install gnome-terminal -y
apt-get install unity-lens-applications -y
apt-get install unity-lens-files -y

echo "Installing Vim"
apt-get install vim -y

echo "Installing tmux"
apt-get install tmux -y

echo "Installing ROS"
apt-get install ros-kinetic-desktop-full -y
apt install ros-kinetic-urg-node -y

# echo "Setting up ROS environment"

# echo "Initializing rosdep..."
# rosdep init
# rosdep update

# echo "Environment setup"

# echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
# source ~/.bashrc

# echo "Installing rosinstall"

# apt-get install python-rosinstall -y

# echo "ROS setup complete"
