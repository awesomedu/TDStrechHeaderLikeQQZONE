//
//  ViewController.m
//  TDStrechHeaderDemo
//
//  Created by 唐都 on 2017/7/10.
//  Copyright © 2017年 com.tagdu.bigtang. All rights reserved.
//

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define TDColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define UserCellIdetifeir @"TDCell"


#import "ViewController.h"
#import "TDNavView.h"
#import "TDCell.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,TDNavViewDelegate>
{
    UIImageView *_headerImage;//header
    UILabel *_nameLabel;
    NSMutableArray *_dataArray;
    
}

@property(nonatomic,strong)UIImageView *backgroundImgView;
@property(nonatomic,assign)float backImgHeight;
@property(nonatomic,assign)float backImgWidth;
@property(nonatomic,strong)TDNavView *NavView;
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self backImageView];
    [self createNaView];
    [self loadData];
    [self layoutTableView];
}

//底部imageView
-(void)backImageView{
    UIImage *image=[UIImage imageNamed:@"back"];
    
    _backgroundImgView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, image.size.height)];
    _backgroundImgView.image=image;
    _backgroundImgView.userInteractionEnabled=YES;
    [self.view addSubview:_backgroundImgView];
    _backImgHeight=_backgroundImgView.frame.size.height;
    _backImgWidth=_backgroundImgView.frame.size.width;
}

- (void)createNaView
{
    self.NavView=[[TDNavView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    self.NavView.title = @"唐唐";
    self.NavView.navColor = [UIColor redColor];
    self.NavView.left_button_image = @"left";
    self.NavView.right_button_image = @"right";
    self.NavView.delegate = self;
    [self.view addSubview:self.NavView];
}

- (void)loadData
{
    _dataArray =[[NSMutableArray alloc]init];
    for (int i = 0; i < 20; i++) {
        NSString * string=[NSString stringWithFormat:@"___第%d行____",i];
        [_dataArray addObject:string];
        
    }
    
}


-(void)layoutTableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.dataSource=self;
        _tableView.delegate=self;
        _tableView.tableFooterView = [[UIView alloc] init];
        [_tableView registerNib:[UINib nibWithNibName:UserCellIdetifeir bundle:nil] forCellReuseIdentifier:UserCellIdetifeir];
        [self.view addSubview:_tableView];
    }
    [_tableView setTableHeaderView:[self headImageView]];
}


-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView=[[UIImageView alloc]init];
        _headImageView.frame=CGRectMake(0, 64, WIDTH, 170);
        _headImageView.backgroundColor=[UIColor clearColor];
        _headImageView.userInteractionEnabled = YES;
        
        _headerImage =[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-35, 50, 70, 70)];
        _headerImage.center=CGPointMake(WIDTH/2, 70);
        [_headerImage setImage:[UIImage imageNamed:@"header"]];
        [_headerImage.layer setMasksToBounds:YES];
        [_headerImage.layer setCornerRadius:35];
        _headerImage.backgroundColor=[UIColor whiteColor];
        _headerImage.userInteractionEnabled=YES;
        UITapGestureRecognizer *header_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(header_tap_Click:)];
        [_headerImage addGestureRecognizer:header_tap];
        [_headImageView addSubview:_headerImage];
        
        
        _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(147, 130, 105, 20)];
        _nameLabel.center = CGPointMake(WIDTH/2, 125);
        _nameLabel.text = @"Rainy";
        _nameLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *nick_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nick_tap_Click:)];
        [_nameLabel addGestureRecognizer:nick_tap];
        _nameLabel.textColor=[UIColor whiteColor];
        _nameLabel.textAlignment=NSTextAlignmentCenter;
        [_headImageView addSubview:_nameLabel];
    }
    return _headImageView;
}

#pragma mark ---- UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDCell *cell = [tableView dequeueReusableCellWithIdentifier:UserCellIdetifeir forIndexPath:indexPath];
    cell.lab_text = [_dataArray objectAtIndex:indexPath.row];
    cell.img_name = @"cellImage";
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int contentOffsety = scrollView.contentOffset.y;
    NSLog(@"offset = %d",contentOffsety);
    if (scrollView.contentOffset.y<=170) {
        self.NavView.headerBackView.alpha = scrollView.contentOffset.y/170;
        self.NavView.left_button_image = @"left";
        self.NavView.right_button_image = @"right";
        self.NavView.navColor = [UIColor whiteColor];
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }else{
        self.NavView.headerBackView.alpha = 1;
        
        self.NavView.left_button_image = @"theLeft";
        self.NavView.right_button_image = @"theRight";
        self.NavView.navColor = TDColor(87, 173, 104, 1);
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }
    if (contentOffsety<0) {
        CGRect rect = _backgroundImgView.frame;
        rect.size.height = _backImgHeight-contentOffsety;
        rect.size.width = _backImgWidth* (_backImgHeight-contentOffsety)/_backImgHeight;
        rect.origin.x =  -(rect.size.width-_backImgWidth)/2;
        rect.origin.y = 0;
        _backgroundImgView.frame = rect;
    }else{
        CGRect rect = _backgroundImgView.frame;
        rect.size.height = _backImgHeight;
        rect.size.width = _backImgWidth;
        rect.origin.x = 0;
        rect.origin.y = -contentOffsety;
        _backgroundImgView.frame = rect;
        
    }
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




#pragma - mark Click
- (void)leftClick
{
    NSLog(@"左侧被点击");
}

- (void)rightClick
{
    NSLog(@"you侧被点击");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)header_tap_Click:(UITapGestureRecognizer *)tap
{
    NSLog(@"头像");
}
//昵称
-(void)nick_tap_Click:(UIButton *)item
{
    NSLog(@"昵称");
}



@end
