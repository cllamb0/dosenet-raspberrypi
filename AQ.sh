#! /bin/sh

HOME=/home/pi
DOSENET=$HOME/dosenet-raspberrypi

LOG=/tmp/air_quality.log

case "$1" in
  start)
    echo "Starting Air Quality Sensor script" > $LOG
    # -dm runs screen in background. doesn't work without it on Raspbian Jesse.
    sudo python $DOSENET/managers.py --logfile $LOG >>$LOG 2>&1 --sensor_type 3
    echo "Finished Air Quality Sensor script" >> $LOG
    ;;
  stop)
    echo "Stopping Air Quality Sensor script" >> $LOG
    sudo pkill -SIGTERM -f managers.py
    ;;
 *)
    echo "Usage: /home/pi/dosenet-raspberrypi/pocket.sh {start|stop}"
    exit 1
    ;;
esac

exit 0