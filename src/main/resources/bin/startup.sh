#!/bin/sh
#-------------------------------------------------------------------------------------------------------------
#该脚本的使用方式为-->[sh startup.sh]
#该脚本可在服务器上的任意目录下执行,不会影响到日志的输出位置等
#-------------------------------------------------------------------------------------------------------------
if [ ! -n "$JAVA_HOME" ]; then
	export JAVA_HOME="/usr/local/jdk1.8.0_60"
fi

#-------------------------------------------------------------------------------------------------------------
#       系统运行参数
#-------------------------------------------------------------------------------------------------------------
DIR=$(cd "$(dirname "$0")"; pwd)
APP_HOME=${DIR}/..
CLASSPATH=$APP_HOME/conf
#APP_LOG=${APP_HOME}/logs
WEB_INF=${APP_HOME}/WEB_INF
#APP_CONFIG=/home/release/conf/config.properties
APP_MAIN=com.melinkr.portal.PortalApplication

JAVA_OPTS="$JAVA_OPTS -server -Xms512m -Xmx512m -Xmn128m -XX:ParallelGCThreads=20 -XX:+UseConcMarkSweepGC -XX:MaxGCPauseMillis=850 -XX:+PrintGCDetails -Xloggc:$APP_LOG/gc.log -Dfile.encoding=UTF-8"
#JAVA_OPTS="$JAVA_OPTS -DlogPath=$APP_LOG"
#JAVA_OPTS="$JAVA_OPTS -Ddisconf=${APP_CONFIG}"

echo "JAVA_HOME="$JAVA_HOME
echo "CLASSPATH="$CLASSPATH
echo "JAVA_OPTS="$JAVA_OPTS

#-------------------------------------------------------------------------------------------------------------
#   程序开始
#-------------------------------------------------------------------------------------------------------------
for appJar in "$APP_HOME"/lib/*.jar;
do
   CLASSPATH="$CLASSPATH":"$appJar"
done
CLASSPATH="$CLASSPATH":"$WEB_INF"
PID=0

getPID(){
    javaps=`$JAVA_HOME/bin/jps -l | grep $APP_MAIN`
    if [ -n "$javaps" ]; then
        PID=`echo $javaps | awk '{print $1}'`
    else
        PID=0
    fi
}

startup(){
    getPID
    echo "================================================================================================================"
    if [ $PID -ne 0 ]; then
        echo "$APP_MAIN already started(PID=$PID)"
        echo "================================================================================================================"
    else
        echo -n "Starting $APP_MAIN"
         if [ ! -d "$APP_LOG" ]; then
            mkdir "$APP_LOG"
         fi
        nohup $JAVA_HOME/bin/java $JAVA_OPTS -classpath $CLASSPATH $APP_MAIN &
        for i in $(seq 5)
        do
        sleep 0.8
        echo -e  ".\c"
        done
        getPID
        if [ $PID -ne 0 ]; then
            echo "(PID=$PID)...[Success]"
            echo "================================================================================================================"
        else
            echo "[Failed]"
            echo "================================================================================================================"
        fi
    fi
}

startup