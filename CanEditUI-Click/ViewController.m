//
//  ViewController.m
//  CanEditUI
//
//  Created by Mengying Xu on 14-10-20.
//  Copyright (c) 2014年 Crystal Xu. All rights reserved.
//

#import "ViewController.h"
#import "CanClickSegmentText.h"
#import "CanEditBtn.h"

@interface ViewController ()<CanEditBtnDelegate,CanClickSegmentTextDelegate>

@property (nonatomic)NSInteger lastIndex;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lastIndex = -1;
    CanEditBtn *nameBtn = [[CanEditBtn alloc] initWithFrame:CGRectMake(100, 100, 100, 40) WithTitle:@"点击之前" WithImage:[UIImage imageNamed:@"down"]];
    [nameBtn setTitle:@"点击之前" forState:UIControlStateNormal];
    [nameBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    nameBtn.delegate = self;
    nameBtn.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:nameBtn];
    
    NSArray *arr = [[NSArray alloc] initWithObjects:@"星期\n一", @"星期\n二", @"星期\n三", @"星期\n四", @"星期\n五", @"星期\n六", @"星期\n日", nil];
    NSArray *arr2 = [[NSArray alloc] initWithObjects:@"星期\n一", @"星期\n二", @"星期\n三", @"星期\n四", @"星期\n五", @"星期\n六", @"星期\n日",@"Monday", nil];
    
    CanClickSegmentText *clickTextOneLine = [[CanClickSegmentText alloc] init];
    
    [clickTextOneLine cellWithItems:arr WithWidth:self.view.frame.size.width];
    clickTextOneLine.frame = CGRectMake(10, 280, self.view.frame.size.width-20, [clickTextOneLine caculateClickTextHeight]);
    clickTextOneLine.backgroundColor = [UIColor orangeColor];
    clickTextOneLine.delegate = self;
    
    [self.view addSubview:clickTextOneLine];
    
    
    CanClickSegmentText *clickTextMoreLine = [[CanClickSegmentText alloc] init];
    
    [clickTextMoreLine cellWithItems:arr2 WithWidth:150];
    clickTextMoreLine.frame = CGRectMake(10, 360, 150, [clickTextMoreLine caculateClickTextHeight]);
    clickTextMoreLine.backgroundColor = [UIColor yellowColor];
    clickTextMoreLine.delegate = self;
    [self.view addSubview:clickTextMoreLine];
    
}

- (void)clickAction:(NSInteger)index withevent:(id)sender
{
    if(index != self.lastIndex)
    {
        if(self.lastIndex != -1)
        {
            if([sender isKindOfClass:[NSMutableArray class]])
            {
                UILabel *lastlbl = (UILabel*)[(NSMutableArray*)sender objectAtIndex:self.lastIndex];
                lastlbl.textColor = [UIColor blackColor];
                
            }
            
        }
        
        UILabel *lbbl = (UILabel*)[(NSMutableArray*)sender objectAtIndex:index];
        
        lbbl.textColor = [UIColor redColor];
        self.lastIndex = index;
    }
    
}

- (void)editBtnAction:(id)sender
{
    CanEditBtn *btn = (CanEditBtn*)sender;
    btn.selected = !btn.isSelected;
    if(btn.selected)
    {
        
        [btn reloadBtnUIWithTitle:@"点击之后fdehsrtgdhr" WithImage:[UIImage imageNamed:@"down_up"]];
    }
    else
    {
        
        [btn reloadBtnUIWithTitle:@"点击之前" WithImage:[UIImage imageNamed:@"down"]];
        
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
