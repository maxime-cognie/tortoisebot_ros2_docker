#!/bin/bash

source ~/ros2_ws/install/setup.bash
ros2 launch tortoisebot_bringup bringup.launch.py use_sim_time:=True

# Execute the command passed into this entrypoint
exec "$@"