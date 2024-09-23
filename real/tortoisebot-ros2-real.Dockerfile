FROM arm64v8/ros:galactic-ros-base-focal

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    git \
    ros-galactic-joint-state-publisher \
    ros-galactic-robot-state-publisher \
    ros-galactic-cartographer \
    ros-galactic-cartographer-ros \
    ros-galactic-gazebo-plugins \
    ros-galactic-teleop-twist-keyboard  \
    ros-galactic-teleop-twist-joy \
    ros-galactic-xacro \
    ros-galactic-nav2* \
    ros-galactic-urdf \
    libraspberrypi-bin \
    libraspberrypi-dev \
    ros-galactic-rviz2 \
    libraspberrypi0 \
    python3-dev \
    python3-rpi.gpio \
    ros-galactic-v4l2-camera \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ros2_ws/src
WORKDIR /ros2_ws/src

RUN /bin/bash -c "git clone -b ros2-galactic https://github.com/rigbetellabs/tortoisebot.git"

WORKDIR /ros2_ws/

RUN /bin/bash -c "source /opt/ros/galactic/setup.bash && colcon build"

COPY mmal_service_16.1.yaml /root/.ros/camera_info/
COPY ./ros-entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

# /bin/bash is the command we want to execute when running a docker container
ENTRYPOINT ["./entrypoint.sh"]