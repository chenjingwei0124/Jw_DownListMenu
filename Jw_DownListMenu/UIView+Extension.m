//
//  UIView+Extension.m

//
//  Created by Jw on 16/3/7.
//  Copyright © 2016年 Jw. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)


- (UIViewController *)jw_viewController
{
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}

- (CGFloat)jw_bottom{
    
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setJw_bottom:(CGFloat)jw_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = jw_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)jw_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setJw_right:(CGFloat)jw_right
{
    CGRect frame = self.frame;
    frame.origin.x = jw_right - frame.size.width;
    self.frame = frame;
}

- (void)setJw_x:(CGFloat)jw_x
{
    CGRect frame = self.frame;
    frame.origin.x = jw_x;
    self.frame = frame;
}

- (void)setJw_y:(CGFloat)jw_y
{
    CGRect frame = self.frame;
    frame.origin.y = jw_y;
    self.frame = frame;
}

- (CGFloat)jw_x
{
    return self.frame.origin.x;
}

- (CGFloat)jw_y
{
    return self.frame.origin.y;
}

- (void)setJw_centerX:(CGFloat)jw_centerX
{
    CGPoint center = self.center;
    center.x = jw_centerX;
    self.center = center;
}

- (CGFloat)jw_centerX
{
    return self.center.x;
}

- (void)setJw_centerY:(CGFloat)jw_centerY
{
    CGPoint center = self.center;
    center.y = jw_centerY;
    self.center = center;
}

- (CGFloat)jw_centerY
{
    return self.center.y;
}

- (void)setJw_width:(CGFloat)jw_width
{
    CGRect frame = self.frame;
    frame.size.width = jw_width;
    self.frame = frame;
}

- (void)setJw_height:(CGFloat)jw_height
{
    CGRect frame = self.frame;
    frame.size.height = jw_height;
    self.frame = frame;
}

- (CGFloat)jw_height
{
    return self.frame.size.height;
}

- (CGFloat)jw_width
{
    return self.frame.size.width;
}

- (void)setJw_size:(CGSize)jw_size
{
    CGRect frame = self.frame;
    frame.size = jw_size;
    self.frame = frame;
}

- (CGSize)jw_size
{
    return self.frame.size;
}

- (void)setJw_origin:(CGPoint)jw_origin
{
    CGRect frame = self.frame;
    frame.origin = jw_origin;
    self.frame = frame;
}

- (CGPoint)jw_origin
{
    return self.frame.origin;
}

@end
