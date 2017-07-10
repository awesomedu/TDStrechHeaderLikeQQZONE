//
//  TDNavView.h
//  TDStrechHeaderDemo
//
//  Created by 唐都 on 2017/7/10.
//  Copyright © 2017年 com.tagdu.bigtang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDNavViewDelegate <NSObject>

@optional
- (void)leftClick;
- (void)rightClick;

@end

@interface TDNavView : UIView

@property (nonatomic, assign) id<TDNavViewDelegate>delegate;
@property (nonatomic, strong) UIImageView *headerBackView;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *navColor;
@property (nonatomic, strong) NSString *left_button_image;
@property (nonatomic, strong) NSString *right_button_image;

@end
