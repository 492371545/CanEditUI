//
//  CheckBoxView.h
//  CanEditUI-Click
//
//  Created by Mengying Xu on 14-10-21.
//  Copyright (c) 2014年 Crystal Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CheckBoxView;

@protocol CheckBoxViewDelegate <NSObject>

- (void)checkBoxPressAction:(CheckBoxView *)checkBox;

@end

@interface CheckBoxView : UIView

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton *checkBtn;
@property (nonatomic, assign) id<CheckBoxViewDelegate> delegate;

@end
