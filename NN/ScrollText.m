//
//  ScrollText.m
//  公告demo
//
//  Created by 陶策均 on 16/8/20.
//  Copyright © 2016年 taocejun. All rights reserved.
//

#import "ScrollText.h"

@interface ScrollText ()<UIScrollViewDelegate>{
    
    NSTimer *_timer;
    CGFloat contentx;
}
@property (strong,nonatomic)UIColor *titleCoclor;//公告文字颜色

@end

@implementation ScrollText

//自定义初始化方法
-(instancetype)initWithFrame:(CGRect)frame withBackGroundColor:(UIColor*)backColor withTitleColor:(UIColor *)titleColor{
    
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.titleArray = titleArray;
        self.scrollEnabled = NO;
        self.backgroundColor = backColor;
        self.titleCoclor = titleColor;
        
        //创建label
        [self creatLabelForScrollView];
        self.delegate = self;
        [self setupTimer];
        
    }
    return self;
}

//开启定时器调用滚动方法
- (void)setupTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

//用自定义button代替label，方便加入点击事件
-(void)creatLabelForScrollView{
    
    if (_titleArray) {
        self.contentSize = CGSizeMake(2*self.frame.size.width*_titleArray.count + self.frame.size.width, self.frame.size.height);
        
        for (int i = 0; i < _titleArray.count; i++) {
            
            UILabel *autoScrollLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width+2 * i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            autoScrollLabel.textAlignment = NSTextAlignmentLeft;
            autoScrollLabel.textColor = [UIColor whiteColor];
            autoScrollLabel.text = _titleArray[i];

//            autoScrollLabel.font = [UIFont systemFontOfSize:8 * ([UIScreen mainScreen].bounds.size.width / 320)];
            
            autoScrollLabel.font = [UIFont fontWithName:@"SimHei" size:7 * ([UIScreen mainScreen].bounds.size.width / 320)];
//            autoScrollLabel.sizeToFit;
            [self addSubview:autoScrollLabel];
        }
    }else{
        
        self.contentSize = CGSizeMake(0, 0);
    }

}

//定时器绑定的方法--》通过改变contentOffset实现滑动
- (void)timerAction:(NSTimer *)timer{
      
    if (contentx>0 && !fmod(floor(self.contentOffset.x)/self.frame.size.width + 1, 2.0)) {
        
        [_timer invalidate];
        
        [self performSelector:@selector(setupTimer) withObject:nil afterDelay:0];
        
    }
    
    if (self.contentOffset.x > self.contentSize.width - self.frame.size.width) {
        contentx = 0;
        [self setContentOffset:CGPointMake(contentx, 0)];
        return;
    }
    
   
    contentx += 1;
    [self setContentOffset:CGPointMake(contentx, 0) animated:nil];

    
}

//捕捉滚动内容的点击事件实现跳转
-(void)buttonAction:(UIButton *)button{
   
//    NSInteger i = button.tag - 1001;
    NSLog(@"触发了点击事件");
   //根据 i 取出某个容器内对应的网址，跳转
    

}

//解决当父View释放时，当前视图因为被Timer强引用而不能释放的问题
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [_timer invalidate];
        _timer = nil;
    }
}

//设置器方法 重新赋值
- (void)setTitleArray:(NSArray *)titleArray{
    
    if (!titleArray) {
        return;
    }
    
    
    if (_titleArray==nil) {
        
        _titleArray = titleArray;
        
        [self creatLabelForScrollView];
        
    }else if (_titleArray.count != titleArray.count){

        _titleArray = titleArray;
        [self creatLabelForScrollView];
        
    }
    
}


@end
