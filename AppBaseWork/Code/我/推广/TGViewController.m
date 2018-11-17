//
//  TGViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TGViewController.h"
#import "CodeHeaderView.h"
@interface TGViewController ()
@property(nonatomic,strong)UIImageView *codeImage;
@end

@implementation TGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = @"推广";
    self.table.hidden = YES;
    [self.view addSubview:self.codeImage];
    CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    NSString *url = [NSString stringWithFormat:@"https://huihuliming.com/fxjz/indexre.html#/?id=%@",[UserData getUserInfo].uid];
    NSData *data=[url dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    //  输出
    CIImage *outputImage=[filter outputImage];
    self.codeImage.image=[self createNonInterpolatedUIImageFormCIImage:outputImage withSize:100.0];
    // Do any additional setup after loading the view.
}
-(UIImageView *)codeImage
{
    if (!_codeImage)
    {
        _codeImage=[[UIImageView alloc]initWithFrame:CGRectMake(0,100, 250*JCLWIDTH/375, 250*JCLWIDTH/375)];
        _codeImage.center = self.view.center;
    }
    return _codeImage;
}
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
