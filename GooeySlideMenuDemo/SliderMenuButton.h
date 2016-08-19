//
//  SliderMenuButton.h
//  GooeySlideMenuDemo
//
//  Created by zhangdongpo on 16/8/19.
//  Copyright © 2016年 zhangdongpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderMenuButton : UIView
/**
 *  convenient init method
 *
 *  @param title title
 *
 *  @return object
 */
-(id)initWithTitle:(NSString *)title;

/**
 *  buttonColor
 */
@property (nonatomic, strong) UIColor *buttonColor;

/**
 *  button click block
 */
@property (nonatomic, copy) void(^buttonClickBlock)(void);
@end
