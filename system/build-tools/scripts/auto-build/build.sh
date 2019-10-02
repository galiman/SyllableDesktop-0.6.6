#!/bin/bash

if [ -z $LOG_DIR ]
then
  LOG_DIR=$HOME/Logs
  LOG=$LOG_DIR/std-out-err.log
fi
if [ -z $SOURCE_DIR ]
then
  SOURCE_DIR=$HOME/Source/Anonymous
fi
if [ -z $BUILD_DIR ]
then
  BUILD_DIR=$HOME/Build
fi

SYSTEM_LOG=$LOG_DIR/system-stdout.log
SYSTEM_FAILURE_LOG=$LOG_DIR/system-failures.log
SYSTEM_SUMMARY_LOG=$LOG_DIR/system-summary.log

BASE_LOG=$LOG_DIR/base-stdout.log
BASE_FAILURE_LOG=$LOG_DIR/base-failures.log
BASE_SUMMARY_LOG=$LOG_DIR/base-summary.log

# If you want to automatically upload the build to
# an FTP server, set the following environment variables
# in your .profile:
#
# FTP_SERVER
# FTP_USER
# FTP_PASSWD
#
# DANGER: This script will perform an "mdel *" command on the
# FTP server once it has logged in: you may not want that to
# happen!  Either use a dedicated user for builds, or remove
# the "mdel *" command below.

# Mark the start
printf "\nBuild started at %s\n" "`date`" >> $LOG

# Make sure we have the latest Builder
echo "Updating Builder"
build update 1>>$LOG 2>&1
build log 1>>$LOG 2>&1
sync

# Build the 'system' profile

cd $BUILD_DIR/system
build prepare system 1>>$LOG 2>&1
build log >> $SYSTEM_LOG
build log summary >> $SYSTEM_SUMMARY_LOG
sync

echo "image system"
image system 1>>$LOG 2>&1
build log >> $SYSTEM_LOG
build log failures >> $SYSTEM_FAILURE_LOG
build log summary >> $SYSTEM_SUMMARY_LOG
sync

# We have to build GrUB with GCC 3

echo "Switching to GCC 3.4.3"
build install $HOME/Packages/gcc-3.4.3-3.i586.resource 1>>$LOG 2>&1
build log >> $SYSTEM_LOG
build log summary >> $SYSTEM_SUMMARY_LOG
sync

echo "Building GrUB"
image sys/boot/grub-0.97 1>>$LOG 2>&1
build log >> $SYSTEM_LOG
# Doesn't work for a single module:
#build log failures >> $SYSTEM_FAILURE_LOG
build log summary >> $SYSTEM_SUMMARY_LOG
sync

echo "Switching to GCC 4.1.2"
build install $HOME/Packages/gcc-4.1.2-3.i586.resource 1>>$LOG 2>&1
build log >> $SYSTEM_LOG
build log summary >> $SYSTEM_SUMMARY_LOG
sync

# Build the 'base' profile
echo "image base"
image base 1>>$LOG 2>&1
build log > $BASE_LOG
build log failures > $BASE_FAILURE_LOG
build log summary > $BASE_SUMMARY_LOG
sync

# Add the compatability files
echo "image compatibility"
image compatibility 1>>$LOG 2>&1
sync

# XXXKV: Now on with the show...
cd stage/image
build scrub 1>>$LOG 2>&1

# Mark the end
echo "Build complete"
printf "Build finished at %s\n" "`date`" >> $LOG
sync

# Transfer the logs
FILES=`ls -1 $LOG_DIR | tr '\n' ' '`
if [ -n "$FTP_USER" ]
then
  echo "Transfering logs"
  cd $LOG_DIR
  ftp -n $FTP_SERVER << END
quote user $FTP_USER
quote pass $FTP_PASSWD
prompt
passive
mdel *
mput $FILES
quit
END
fi

sync
echo "Finished"
exit 0
