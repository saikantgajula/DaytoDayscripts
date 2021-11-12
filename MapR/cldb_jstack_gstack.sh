#/bin/bash

CLDB_PID=`cat /opt/mapr/pid/cldb.pid` 
MFS_PID=`cat /opt/mapr/pid/mfs.pid` 
TIME=`date +%Y-%m-%d_%H:%M:%S` 
mkdir /tmp/support LOG_DIR=/tmp/support
SLEEP_DURATION=5


#Take jstack of cldb
echo "Starting jstack for cldb pid"
for i in `seq 1 10`;do
        jstack -l $CLDB_PID > $LOG_DIR/jstack.$CLDB_PID.$i.$TIME
        echo "$i:Written output to  $LOG_DIR/jstack.$CLDB_PID.$i.$TIME .Sleeping for $SLEEP_DURATION secs"
        sleep $SLEEP_DURATION
done

#Take gstack
echo "Starting gstack for mfs pid"

for i in `seq 1 10`;do
        gstack  $MFS_PID > $LOG_DIR/gstack.$MFS_PID.$i.$TIME
        echo "$i:Written output to $LOG_DIR/gstack.$MFS_PID.$i.$TIME .Sleeping for $SLEEP_DURATION secs"
        sleep $SLEEP_DURATION
done

