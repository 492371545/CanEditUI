//
//  CanEditBtn.h
//  GQ_Manage_MobileHospital
//
//  Created by Mengying Xu on 14-10-11.
//  Copyright (c) 2014年 Mengying Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

//修改UIButton的image位置，image在右，label在左
@protocol CanEditBtnDelegate <NSObject>

- (void)editBtnAction:(id)sender;

@end

@interface CanEditBtn : UIButton

@property (nonatomic,assign)id<CanEditBtnDelegate>delegate;

- (id)initWithFrame:(CGRect)frame WithTitle:(NSString*)str WithImage:(UIImage*)imag;
- (void)reloadBtnUIWithTitle:(NSString*)str WithImage:(UIImage*)imag;

@end
