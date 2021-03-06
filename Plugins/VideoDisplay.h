/*
 * 视频播放，提供了相应的接口，
 * 成员变量主要用于消息队列获取数据，
 * 实现类必须继承该抽象类
 */

#ifndef _VIDEO_DISPLAY_H
#define _VIDEO_DISPLAY_H

#include "DataToUI.h"
#include "DataBufferPointer.h"
#include <QThread>

struct PicYUV;

class VideoDisplay : public QThread
{
public:
    VideoDisplay() :
        class_name("VideoDisplay"),
        shut_down(true)
    {
        DataBufferPointer::GetInstance().GetPicYUVData()->RegistCustomer(ClassName());
    }

public:
    virtual bool Initial() = 0;

    void ShutDown()
    {
        shut_down = false;
    }

protected:
    std::string ClassName()
    {
        return class_name;
    }

    void ThrowError(const QString& err)
    {
        DataToUI::GetInstance().setParament(err);
    }

    void ShowImage(const QImage& image)
    {
        DataToUI::GetInstance().setParament(image);
    }

protected:
    bool shut_down;

private:
    const std::string class_name;
};

#endif // _VIDEO_DISPLAY_H
