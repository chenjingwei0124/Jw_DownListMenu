//
//  UIView+Extension.h

//
//  Created by Jw on 16/3/7.
//  Copyright © 2016年 Jw. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Extension)

@property (nonatomic, assign) CGFloat jw_x;
@property (nonatomic, assign) CGFloat jw_y;
@property (nonatomic, assign) CGFloat jw_centerX;
@property (nonatomic, assign) CGFloat jw_centerY;
@property (nonatomic, assign) CGFloat jw_width;
@property (nonatomic, assign) CGFloat jw_height;
@property (nonatomic, assign) CGSize jw_size;
@property (nonatomic, assign) CGPoint jw_origin;

@property (nonatomic, assign) CGFloat jw_bottom;
@property (nonatomic, assign) CGFloat jw_right;

@property (nonatomic, readonly)UIViewController *jw_viewController; //获取当前视图的Controller

@end
