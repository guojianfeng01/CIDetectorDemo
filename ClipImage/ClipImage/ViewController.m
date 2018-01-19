//
//  ViewController.m
//  ClipImage
//
//  Created by guojianfeng on 2017/12/22.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "UIImage+clip.h"
#import "PersonView.h"

@interface ViewController (){
    int _count;
}
@property (nonatomic, strong) UIImageView *originImageView;
@property (nonatomic, strong) UIImageView *faceImageView;
@property (nonatomic, strong) PersonView *cariouslView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 1;
    [self.cariouslView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.width.mas_equalTo(self.view.bounds.size.width);
        make.height.mas_equalTo(130);
    }];
//    [NSTimer scheduledTimerWithTimeInterval:1/24.0 target:self selector:@selector(clip:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)beginDetectorFacewithImage:(UIImage *)image{
    
    //1 将UIImage转换成CIImage
    CIImage* ciimage = [CIImage imageWithCGImage:image.CGImage];
    
    //缩小图片，默认照片的图片像素很高，需要将图片的大小缩小为我们现实的ImageView的大小，否则会出现识别五官过大的情况
//    float factor = 0.8;
//    float height = [UIScreen mainScreen].bounds.size.width / (image.size.width/image.size.height);
    //    self.faceView.frame = CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, height);
    //    self.faceView.image = image;
//        ciimage = [ciimage imageByApplyingTransform:CGAffineTransformMakeScale(factor, factor)];
    
    //2.设置人脸识别精度
    NSDictionary* opts = [NSDictionary dictionaryWithObject:
                          CIDetectorAccuracyLow forKey:CIDetectorAccuracy];
    //3.创建人脸探测器
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil options:opts];
    //4.获取人脸识别数据
    NSArray* features = [detector featuresInImage:ciimage];
    NSMutableArray* faces = [NSMutableArray array];
//    5.分析人脸识别数据
    for (CIFaceFeature *faceFeature in features){

        //注意坐标的换算，CIFaceFeature计算出来的坐标的坐标系的Y轴与iOS的Y轴是相反的,需要自行处理

        CGFloat faceWidth = faceFeature.bounds.size.width;
        self.faceImageView.frame = CGRectMake(100, 200, 198, 198);
        UIImage *tmpImage = [image getSubImage:CGRectMake(faceFeature.bounds.origin.x - 5,image.size.height - faceFeature.bounds.origin.y - faceWidth - 5, faceWidth+10, faceWidth+10)];
        UIImage *grayImage = [tmpImage getGrayImage];
//        UIImage *smallImage = [grayImage imageCompressWithscaledToSize:CGSizeMake(150, 150)];
        self.faceImageView.image = grayImage;
        [faces addObject:grayImage];
    }

    [self.cariouslView updateUIWithArrary:faces];
}


- (IBAction)clip:(id)sender {
    _count = _count + 1;
    if ([UIImage imageNamed:[NSString stringWithFormat:@"test%d",_count]]) {
        [self beginDetectorFacewithImage:[UIImage imageNamed:[NSString stringWithFormat:@"test%d",_count]]];
    }else{
        _count = 1;
        [self beginDetectorFacewithImage:[UIImage imageNamed:[NSString stringWithFormat:@"test%d",_count]]];
    }
}

- (IBAction)clip2:(id)sender {
    _count = 0;
    [self beginDetectorFacewithImage:[UIImage imageNamed:@"test2"]];
}

- (IBAction)clip3:(id)sender {
    _count = 0;
    [self beginDetectorFacewithImage:[UIImage imageNamed:@"test3"]];
}

- (UIImageView *)originImageView{
    if (!_originImageView) {
        _originImageView = [[UIImageView alloc] init];
        [self.view addSubview:_originImageView];
    }
    return _originImageView;
}

- (UIImageView *)faceImageView{
    if (!_faceImageView) {
        _faceImageView = [[UIImageView alloc] init];
        [self.view addSubview:_faceImageView];
    }
    return _faceImageView;
}

- (UIView *)cariouslView{
    if (!_cariouslView) {
        _cariouslView = [[PersonView alloc] init];
        _cariouslView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_cariouslView];
    }
    return _cariouslView;
}

@end
