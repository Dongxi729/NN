//
//  ScrollText.h
//  公告demo
//
//  Created by 陶策均 on 16/8/20.
//  Copyright © 2016年 taocejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollText : UIScrollView

@property (strong,nonatomic)NSArray *titleArray;//存放公告


-(instancetype)initWithFrame:(CGRect)frame withBackGroundColor:(UIColor*)backColor withTitleColor:(UIColor *)titleColor;

@end
