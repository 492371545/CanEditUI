//
//  CheckBoxView.m
//  CanEditUI-Click
//
//  Created by Mengying Xu on 14-10-21.
//  Copyright (c) 2014年 Crystal Xu. All rights reserved.
//

#import "CheckBoxView.h"

@implementation CheckBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.checkBtn];
        [self addSubview:self.titleLab];
    }
    return self;
}
- (UILabel*)titleLab
{
    if(!_titleLab)
    {
        _titleLab = [[UILabel alloc] init];
        
        _titleLab.frame = CGRectMake(35, 0, self.frame.size.width-40, 30);
        _titleLab.backgroundColor = [UIColor clearColor];
        _titleLab.font = [UIFont systemFontOfSize:14];

    }
    
    return _titleLab;
}

- (UIButton*)checkBtn
{
    if(!_checkBtn)
    {
        _checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkBtn.frame = CGRectMake(10, 7.5, 15, 15);
        [_checkBtn setBackgroundImage:[UIImage imageNamed:@"boy"] forState:UIControlStateNormal];
        [_checkBtn setBackgroundImage:[UIImage imageNamed:@"boy_hov"] forState:UIControlStateSelected];
        [_checkBtn addTarget:self action:@selector(checkBoxSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _checkBtn;
}
- (void)checkBoxSelect:(UIButton *)sender
{
    // 如果已经选择，再点击不取消选择状态
    if (sender.selected == NO) {
        sender.selected = YES;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(checkBoxPressAction:)]) {
        [self.delegate checkBoxPressAction:self];
    }
}

@end
