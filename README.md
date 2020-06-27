# yarden-gnome-station-builder

Station requirements:
  1. pre-configured dietpi.img, ready to be copied to sd
      1. hotspot configured
      1. docker is installed
      1. station setup docker is ready to run
      1. station sensor docker is ready to run
      1. contains hotspot-toggle.sh
          1. takes in arguments to start or stop hotspot

  1. Pi hosted web server accessed via hotspot
      1. Button on pi will spin this up
          1. userId is global var in docker image
      1. Hotspot is Captive so that it can redirect to web server for config
      1. User completes setup
      1. Stop hotspot with hotspot-toggle.sh
      1. station/sensors configurable from web now

  1. Station's sensor docker will automatically run once connection is established
      1. won't store anything before being configured from user's profile

  