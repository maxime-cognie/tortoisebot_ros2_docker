#!/bin/bash

source /opt/ros/galactic/setup.bash
source install/setup.bash

# Execute the command passed into this entrypoint
exec "$@"