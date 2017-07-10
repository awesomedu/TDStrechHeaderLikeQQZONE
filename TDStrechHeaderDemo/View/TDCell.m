//
//  TDCell.m
//  TDStrechHeaderDemo
//
//  Created by 唐都 on 2017/7/10.
//  Copyright © 2017年 com.tagdu.bigtang. All rights reserved.
//

#import "TDCell.h"
@interface TDCell ()
@property (weak, nonatomic) IBOutlet UILabel *lab;

@property (weak, nonatomic) IBOutlet UIImageView *img;



@end

@implementation TDCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    [self.img.layer setMasksToBounds:YES];
    [self.img.layer setCornerRadius:self.img.frame.size.width/2];
    self.lab.font = [UIFont systemFontOfSize:12];
    self.lab.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];

}

-(void)setImg_name:(NSString *)img_name
{
    _img_name = img_name;
    self.img.image = [UIImage imageNamed:img_name];
    
}
-(void)setLab_text:(NSString *)lab_text
{
    _lab_text = lab_text;
    self.lab.text = lab_text;
}


@end
