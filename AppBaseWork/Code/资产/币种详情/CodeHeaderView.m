//
//  CodeHeaderView.m
//  AppBaseWork
//
//  Created by apple on 2018/11/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CodeHeaderView.h"

@implementation CodeHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        _transfer_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:1];
        _transfer_lab.text = @"转账";
        _transfer_lab.frame = CGRectMake(0, 0, JCLWIDTH, 50*JCLWIDTH/375);
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 50*JCLWIDTH/375, JCLWIDTH, 2)];
        line.backgroundColor = [UIColor redColor];
        [self addSubview:line];
        
        [self addSubview:self.codeImage];
        NSDictionary *dic = @{@"state":@"0",@"id":[UserData getUserInfo].hytAddr};
        NSData *obj_data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
        NSString *obj_Str = [[NSString alloc]initWithData:obj_data encoding:NSUTF8StringEncoding];
        NSString *encodeURL = [obj_Str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *url = [NSString stringWithFormat:@"%@fxjz/#/?scan=%@",BaseUrl,encodeURL];
        CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
        NSData *data=[url dataUsingEncoding:NSUTF8StringEncoding];
        [filter setValue:data forKey:@"inputMessage"];
        //  输出
        CIImage *outputImage=[filter outputImage];
        self.codeImage.image=[self createNonInterpolatedUIImageFormCIImage:outputImage withSize:100.0];
        
        UILabel *address = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:1];
        address.text = [UserData getUserInfo].hytAddr;
        address.frame = CGRectMake(05*JCLWIDTH/375, self.codeImage.maxY+20*JCLWIDTH/375, JCLWIDTH, 30*JCLWIDTH/375);
        
        
        UILabel *header = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGB(255, 255, 255) alignment:1];
        header.text = @"复制";
        [header tapActionBlock:^{
            [MBProgressHUD showSuccess:@"复制成功!"];
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = [UserData getUserInfo].hytAddr;
            
        }];
        header.backgroundColor = JCLRGBA(0, 0, 0, 1);
        header.frame = CGRectMake(40*JCLWIDTH/375, address.maxY+90*JCLWIDTH/375, JCLWIDTH-80*JCLWIDTH/375, 50*JCLWIDTH/375);
        
    }
    return self;
}
-(UIImageView *)codeImage
{
    if (!_codeImage)
    {
        _codeImage=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, 200*JCLWIDTH/375, 200*JCLWIDTH/375)];
        _codeImage.center = CGPointMake(self.center.x, 170*JCLWIDTH/375);
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
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
