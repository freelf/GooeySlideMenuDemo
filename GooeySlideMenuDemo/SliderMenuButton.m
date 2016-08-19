//
//  SliderMenuButton.m
//  GooeySlideMenuDemo
//
//  Created by zhangdongpo on 16/8/19.
//  Copyright © 2016年 zhangdongpo. All rights reserved.
//

#import "SliderMenuButton.h"

@interface SliderMenuButton ()
@property (nonatomic, copy) NSString *buttonTitle;
@end
@implementation SliderMenuButton
-(id)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.buttonTitle = title;
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect);
    [self.buttonColor set];
    CGContextFillPath(context);
    
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 1, 1) cornerRadius:rect.size.height * 0.5];
    [self.buttonColor setFill];
    [roundedRectanglePath fill];
    [[UIColor whiteColor] setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attribute = @{NSParagraphStyleAttributeName:paragraphStyle,
                                NSFontAttributeName:[UIFont systemFontOfSize:24.0f],
                                NSForegroundColorAttributeName:[UIColor whiteColor]};
    CGSize size = [self.buttonTitle sizeWithAttributes:attribute];
    CGRect r = CGRectMake(rect.origin.x,
                          rect.origin.y +(rect.size.height - size.height),
                          rect.size.width,
                          size.height);
    [self.buttonTitle drawInRect:r withAttributes:attribute];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSUInteger tapCount = touch.tapCount;
    switch (tapCount) {
        case 1:
            self.buttonClickBlock();
            break;
            
        default:
            break;
    }
}
@end
