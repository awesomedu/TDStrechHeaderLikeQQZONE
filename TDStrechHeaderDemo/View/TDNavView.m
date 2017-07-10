//
//  TDNavView.m
//  TDStrechHeaderDemo
//
//  Created by 唐都 on 2017/7/10.
//  Copyright © 2017年 com.tagdu.bigtang. All rights reserved.
//

#import "TDNavView.h"
@interface TDNavView()
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;

@end

@implementation TDNavView



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.headerBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.headerBackView.backgroundColor = [UIColor whiteColor];
        self.headerBackView.alpha = 0;
        [self addSubview:self.headerBackView];
        self.leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton.backgroundColor=[UIColor clearColor];
        self.leftButton.frame=CGRectMake(5, 20, 44, 44);
        [self.leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftButton];
        
        self.backgroundColor=[UIColor clearColor];
        self.label=[[UILabel alloc]initWithFrame:CGRectMake(44, 20, frame.size.width-44-44, 44)];
        self.label.textAlignment=NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:18];
        [self addSubview:self.label];
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButton.backgroundColor = [UIColor clearColor];
        self.rightButton.frame = CGRectMake(self.frame.size.width-46, 30, 30, 30);
        [self.rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightButton];

    }
    
    return self;
}

- (void)setLeft_button_image:(NSString *)left_button_image
{
    _left_button_image = left_button_image;
    [self.leftButton setImage:[UIImage imageNamed:_left_button_image] forState:UIControlStateNormal];
}


- (void)setRight_button_image:(NSString *)right_button_image
{
    _right_button_image = right_button_image;
    [self.rightButton setImage:[UIImage imageNamed:_right_button_image] forState:UIControlStateNormal];
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.label.text = title;
}

- (void)setNavColor:(UIColor *)navColor
{
    _navColor = navColor;
    self.label.textColor = navColor;
}

//左边
-(void)leftClick{
    if ([_delegate respondsToSelector:@selector(leftClick)] ) {
        [_delegate leftClick];
    }
}
//右边
-(void)rightClick{
    if ([_delegate respondsToSelector:@selector(rightClick)]) {
        [_delegate rightClick];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
