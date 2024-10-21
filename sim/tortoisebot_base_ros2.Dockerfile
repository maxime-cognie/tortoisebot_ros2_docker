FROM osrf/ros:galactic-desktop

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    python3-wstool \
    python3-rosdep \
    ninja-build \
    stow \
    ros-galactic-xacro \
    ros-galactic-gazebo-ros \
    ros-galactic-gazebo-ros-pkgs \
    ros-galactic-gazebo-ros2-control \
    ros-galactic-robot-state-publisher \
    ros-galactic-joint-state-publisher \
    ros-galactic-cartographer  \
    ros-galactic-turtlebot3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN mkdir -p /ros2_ws
WORKDIR /ros2_ws
COPY ./ ./
RUN rm -r tortoisebot_ros2_docker

RUN echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

CMD ["bash"]