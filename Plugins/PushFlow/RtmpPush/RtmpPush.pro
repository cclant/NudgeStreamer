#-------------------------------------------------
#
# Project created by QtCreator 2017-05-31T14:33:58
#
#-------------------------------------------------

QT       += gui

TARGET = RtmpPush
TEMPLATE = lib
CONFIG += staticlib
DEFINES +=  RTMPPUSH_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#DEFINES +=  FILE_H264_4_TEST

CONFIG  +=  c++11

unix{
DESTDIR +=  $$PWD/../../bin/
}

win32{
CONFIG(debug, debug | release):{
DESTDIR +=  $$PWD/../../../bin/Debug/Plugins/PushFlow/RtmpPush/
}else{
DESTDIR +=  $$PWD/../../../bin/Release/Plugins/PushFlow/RtmpPush/
}
}

INCLUDEPATH +=  ./ \
                ./../../ \
                ./../../../Streamer

SOURCES +=  RtmpPush.cpp

HEADERS +=  RtmpPush.h \
            SpsDecode.h

#引入rtmp库
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../lib/rtmp/lib/Release/ -lrtmp
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../lib/rtmp/lib/Debug/ -lrtmp
else:unix: LIBS += -L$$PWD/../../../lib/rtmp/lib/ -lrtmp

INCLUDEPATH += $$PWD/../../../lib/rtmp/include
DEPENDPATH += $$PWD/../../../lib/rtmp/include

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../lib/rtmp/lib/Release/librtmp.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../lib/rtmp/lib/Debug/librtmp.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../lib/rtmp/lib/Release/rtmp.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../lib/rtmp/lib/Debug/rtmp.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../../lib/rtmp/lib/librtmp.a

unix {
    target.path = /usr/lib
    INSTALLS += target
}

# Log
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../bin/Release/ -lLog
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../bin/Debug/ -lLog
else:unix: LIBS += -L$$OUT_PWD/../../../bin/ -lLog

INCLUDEPATH += $$PWD/../../../Log
DEPENDPATH += $$PWD/../../../Log

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../bin/Release/libLog.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../bin/Debug/libLog.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../bin/Release/Log.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../bin/Debug/Log.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../../bin/libLog.a
