//
//  RXPath.m
//  Jincelue
//
//  Created by 邢昭俊 on 2017/1/16.
//  Copyright © 2017年 ruixue. All rights reserved.
//

#import "JCLKitObj.h"

@implementation JCLKitObj
#pragma mark - UIKit
+(UIView *)JCLView:(UIView *)parent color:(UIColor *)color{
    UIView *view = [[UIView alloc]init]; [parent addSubview:view]; view.backgroundColor = color; return view;
}

+(UIView *)JCLView:(UIView *)parent color:(UIColor *)color target:(id)target action:(SEL)action{
    UIView *view = [self JCLView:parent color:color];
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:target action:action]];
    return view;
}

+(UIView *)RXView:(UIView *)parent color:(UIColor *)color{
    UIView *view = [self JCLView:parent color:color];
    view.transform = CGAffineTransformMakeRotation(M_PI*0.5); [UIView commitAnimations];
    return view;
}

+(UIImageView *)JCLImage:(UIView *)parent{
    UIImageView *image = [[UIImageView alloc]init]; [parent addSubview:image];
    image.userInteractionEnabled = YES; image.layer.masksToBounds = YES;
    return image;
}

+(UILabel *)JCLLable:(UIView *)parent font:(NSInteger)font color:(UIColor *)color alignment:(NSInteger)alignment{
    UILabel *lable = [[UILabel alloc]init]; [parent addSubview:lable];
    lable.font = [self JCLFont:font]; lable.textColor = color;
    lable.textAlignment = alignment; lable.numberOfLines = 0;
    lable.userInteractionEnabled = YES;  lable.layer.masksToBounds = YES;
    return lable;
}

+(UITextField *)JCLField:(UIView *)parent font:(CGFloat)font color:(UIColor *)color delegate:(id)delegate{
    UITextField *field = [[UITextField alloc]init];
    [parent addSubview:field];
    field.font = [self JCLFont:font];
    field.textColor = color;
    field.textAlignment = NSTextAlignmentLeft;
    field.borderStyle = UITextBorderStyleNone;
    field.delegate = delegate;
    field.clearButtonMode = YES;
    return field;
}

+(UITextView *)JCLText:(UIView *)parent font:(NSInteger)font color:(UIColor *)color{
    UITextView *text = [[UITextView alloc]init]; [parent addSubview:text];
    text.font = [self JCLFont:font]; text.textColor = color;
    return text;
}

+(UIButton *)JCLButton:(UIView *)parent img:(NSString *)img size:(CGFloat)size target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc]init]; [parent addSubview:button];
    [button setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    button.titleLabel.font = [self JCLFont:size];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.layer.masksToBounds = YES;
    return button;
}

+(UIScrollView *)JCLScroll:(UIView *)parent page:(BOOL)page delegate:(id)delegate{
    UIScrollView *scroll = [[UIScrollView alloc] init];
    [parent addSubview:scroll];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = YES;
    scroll.pagingEnabled = page;
    scroll.delegate = delegate;
    scroll.bounces = NO;
    return scroll;
}

+(UIPageControl *)JCLPage:(UIView *)parent color:(UIColor *)color current:(UIColor *)current{
    UIPageControl *page = [[UIPageControl alloc] init];
    [parent addSubview:page];
    page.currentPageIndicatorTintColor = current;
    page.pageIndicatorTintColor = color;
    return page;
}

+(UITableView *)JCLTable:(UIView *)parent target:(id)target frame:(CGRect)frame style:(UITableViewStyle)style{
    UITableView *table = [[UITableView alloc]initWithFrame:frame style:style];
    [parent addSubview:table];
    table.dataSource = target;
    table.delegate = target;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    return table;
}

+(UICollectionView *)JCLCollect:(UIView *)parent target:(id)target frame:(CGRect)frame style:(NSInteger)style{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setScrollDirection:style];
    UICollectionView *collect = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flow];
    [parent addSubview:collect];
    collect.dataSource = target;
    collect.delegate = target;
    if (style == 4) {
        collect.showsHorizontalScrollIndicator = NO;
        collect.alwaysBounceHorizontal = NO;
    } else {
        collect.showsHorizontalScrollIndicator = NO;
    }
    collect.scrollEnabled = YES;
    collect.alwaysBounceVertical = YES;
    return collect;
}

+ (UICollectionView *)JCLCollect:(UIView *)parent target:(id)target frame:(CGRect)frame cell:(Class)cell ident:(NSString *)ident style:(NSInteger)style{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:style];
    UICollectionView *collect = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    [parent addSubview:collect];
    collect.dataSource = target; collect.delegate = target;
    [collect registerClass:cell forCellWithReuseIdentifier:ident];
    if (style == 44) {
        collect.showsHorizontalScrollIndicator = NO;
        collect.alwaysBounceHorizontal = NO;
    } else {
        collect.showsHorizontalScrollIndicator = NO;
    }
    collect.backgroundColor = JCLBGRGB;
    collect.scrollEnabled = YES;
    collect.alwaysBounceVertical = YES;
    return collect;
}

#pragma mark - JCLSetup
+(CGSize)JCLStrSize:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

+(CGSize)JCLStrSize:(NSString *)text font:(UIFont *)font{
    return [self JCLStrSize:text font:font maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
}

+(CGFloat)JCLSize:(CGFloat)size{
    
    return size*JCLWIDTH/375;
}
+(UIFont *)JCLFont:(CGFloat)size{
   
    return [UIFont systemFontOfSize:size*JCLWIDTH/375];
}
+(CGFloat)JCLHeight:(CGFloat)height{  return height*JCLWIDTH/375;}

+(NSArray *)JCLRemoveKit:(NSMutableArray *)arrM{
    [arrM enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) { [obj removeFromSuperview]; }];
    [arrM removeAllObjects];
    return arrM;
}
+(NSArray *)JCLRemoveLayer:(NSMutableArray *)arrM{
    [arrM enumerateObjectsUsingBlock:^(CAShapeLayer *obj, NSUInteger idx, BOOL * _Nonnull stop) { [obj removeFromSuperlayer]; }];
    [arrM removeAllObjects];
    return arrM;
}

+(NSString *)JCLBundle:(NSString *)str{
    NSBundle *bundle = [NSBundle bundleWithPath: [[NSBundle mainBundle] pathForResource: @"JCLBundle"  ofType: @"bundle"]];
    return [[bundle resourcePath] stringByAppendingPathComponent: str];
}

#pragma mark ---- UIGestureRecognizer
+ (UIPinchGestureRecognizer *)RXPinch:(UIView *)parentView target:(id)target action:(SEL)action{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:target action:action];
    [parentView addGestureRecognizer:pinch]; return pinch;
}

+ (UIPanGestureRecognizer *)RXPan:(UIView *)parentView target:(id)target action:(SEL)action{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    [parentView addGestureRecognizer:pan]; pan.delegate = target; return pan;
}

+ (UILongPressGestureRecognizer *)RXLongPress:(UIView *)parentView target:(id)target action:(SEL)action{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:action];
    [parentView addGestureRecognizer:longPress]; return longPress;
}

+ (UITapGestureRecognizer *)RXTap:(id)parent target:(id)target action:(SEL)action number:(NSUInteger)number{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [parent addGestureRecognizer:tap]; tap.numberOfTapsRequired = number; return tap;
}

#pragma mark - NSMutableAttributedString
+(NSString *)JCLStr:(NSString *)str{ return str.length ? str : @""; }
+(NSString *)JCLInt:(NSString *)str{ return str.length ? [NSString stringWithFormat:@"%ld", (long)str.integerValue] : @"0"; }
+(NSString *)JCLDou:(NSString *)str type:(NSInteger)type{
    if (type == 1) {
        return str.length ? [NSString stringWithFormat:@"%.2lf", str.floatValue] : @"0.00";
    } else {
        return str.length ? [NSString stringWithFormat:@"%.2lf%%", str.floatValue] : @"0.00%";
    }
}
+(NSMutableAttributedString *)RXAttStr:(NSString *)str color:(UIColor *)color beginIdx:(NSInteger)idx{
    NSMutableAttributedString *strM = [[NSMutableAttributedString alloc] initWithString:str];
    [strM addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, idx)];
    return strM;
}

+(NSMutableAttributedString *)RXAttStr:(NSString *)str color:(UIColor *)color endIdx:(NSInteger)idx{
    NSMutableAttributedString *strM = [[NSMutableAttributedString alloc] initWithString:str];
    [strM addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(str.length - idx, idx)];
    return strM;
}

+(NSMutableAttributedString *)RXAttStr:(NSString *)str spac:(NSUInteger)spac{
    NSMutableAttributedString *strM = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:spac];
    [strM addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [str length])];
    return strM;
}

+(CGSize)JCLTextSize:(NSString *)str font:(UIFont *)font{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f};
    return [str boundingRectWithSize:CGSizeMake(JCLWIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}

+(CGSize)JCLTextSize:(NSString *)str spac:(CGFloat)spac font:(UIFont *)font width:(CGFloat)width{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = spac;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f};
    return [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}

+(CGSize)JCLTextSize:(NSString *)val font:(UIFont *)font width:(float)width{
    UITextView *text = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    text.text = val; text.font = font;
    return [text sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
}

+(CGSize)JCLAttTextSize:(NSAttributedString *)val font:(UIFont *)font width:(float)width{
    UITextView *text = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    text.attributedText = val; text.font = font;
    return [text sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
}

+(CGFloat)JCLArrStrH:(NSString *)str spac:(CGFloat)spac font:(CGFloat)font width:(CGFloat)width{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = spac;
    NSDictionary *dic = @{NSFontAttributeName:[self JCLFont:font], NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f};
    CGSize size = [str boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

+(NSMutableAttributedString *)RXAttStr:(NSString *)str icon:(NSString *)icon y:(CGFloat)y wh:(CGFloat)wh idx:(NSUInteger)idx{
    NSMutableAttributedString *strM = [[NSMutableAttributedString alloc] initWithString:str];
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:icon]; attachment.bounds = CGRectMake(0, y, wh, wh);
    [strM insertAttributedString:[NSAttributedString attributedStringWithAttachment:attachment] atIndex:idx];
    return strM;
}

#pragma mark - NSDateFormatter
+(NSString *)JCLDate{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    return [formatter stringFromDate:date];
}

+(NSString *)JCLDate:(NSString *)str style:(NSString *)style{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:str];
    [formatter setDateFormat:style];
    return [formatter stringFromDate:date];
}

+(NSString *)JCLDate:(NSString *)begin end:(NSString *)end{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *beginDate = [formatter dateFromString:begin];
    NSDate *endDate = [formatter dateFromString:end];
    NSTimeInterval time = [endDate timeIntervalSinceDate:beginDate];
    //int month = ((int)time)/(3600*24*30);
    int days = ((int)time)/(3600*24);
    int hours = ((int)time)%(3600*24)/3600;
    int minute = ((int)time)%(3600*24)/60;
    
    NSString *times;
//    if(month != 0){
//        times = [NSString stringWithFormat:@"%i 个月 %i", month, days];
//    } else
    if(days != 0){
        times = [NSString stringWithFormat:@"%i 天", days];
    } else if(hours != 0){
        times = [NSString stringWithFormat:@"%i 小时", hours];
    } else {
        times = [NSString stringWithFormat:@"%i 分钟", minute];
    }
    return times;
}

+(NSInteger)JCLDay:(NSInteger)year month:(NSInteger)month{
    if((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12)) return 31 ;
    if((month == 4) || (month == 6) || (month == 9) || (month == 11)) return 30;
    if((year % 4 == 1) || (year % 4 == 2) || (year % 4 == 3)) return 28;
    if(year % 400 == 0) return 29; if(year % 100 == 0) return 28;
    return 29;
}

+(UIColor *)JCLHexCol:(NSString *)color{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) { return [UIColor clearColor]; }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+(UIImage *)JCLImgCol:(UIColor *)col{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context  = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [col CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+(NSString *)isNull:(NSString *)val{
    if (val == nil || val == NULL) {
        return @"--";
    }
    if ([val isKindOfClass:[NSNull class]]) {
        return @"--";
    } else {
        return val;
    }
}
+(NSString *)base64EncodeString:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}
//对一个字符串进行base解码
+(NSString *)base64DecodeString:(NSString *)string
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
}
+ (NSString *)stringChangeMoneyWithStr:(NSString *)str numberStyle:(NSNumberFormatterStyle)numberStyle {
    
    // 判断是否null 若是赋值为0 防止崩溃
    if (([str isEqual:[NSNull null]] || str == nil)) {
        str = 0;
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = numberStyle;
    // 注意传入参数的数据长度，可用double
    NSString *money = [formatter stringFromNumber:[NSNumber numberWithDouble:[str doubleValue]]];
    
    return money;
}
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    
    
      NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
      [formatter setDateStyle:NSDateFormatterMediumStyle];
    
      [formatter setTimeStyle:NSDateFormatterShortStyle];
    
      [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
      NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
      [formatter setTimeZone:timeZone];
    
      NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
      NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];

      return confromTimespStr;
    
}
@end
