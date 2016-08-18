//
//  YZMenuButton.m
//  PullDownMenu
//
//  Created by yz on 16/8/12.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZMenuButton.h"
#import "UIView+Extension.h"

@implementation YZMenuButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.jw_x < self.titleLabel.jw_x) {
        
        self.titleLabel.jw_x = self.imageView.jw_x;
        
        self.imageView.jw_x = self.titleLabel.jw_right + 10;
    }
    
}

@end
