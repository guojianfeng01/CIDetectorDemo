# CIDetectorDemo
CIDetector can get faces with Image
CIDetector这个类用于识别、检测静止图片或者视频中的显著特征（面部，矩形和条形码），识别的具体特征由CIFeature类去处理
CIFeature类只保存基本信息， 所有的附加信息由子类保存。

iPhone 目前提供的人脸识别比较简单，只能识别一些简单的面部表情；
1 将UIImage转换成CIImage
CIImage* ciimage = [CIImage imageWithCGImage:image.CGImage];
//2.设置人脸识别精度
NSDictionary* opts = [NSDictionary dictionaryWithObject:
                          CIDetectorAccuracyLow forKey:CIDetectorAccuracy];
//3.创建人脸探测器
CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil options:opts];
//4.获取人脸识别数据
 NSArray* features = [detector featuresInImage:ciimage];
 
 之后有图片处理扩展类 #import "UIImage+clip.h"
 实现图片裁剪和图片灰度功能。
