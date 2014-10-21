//
//  CanClickSegmentText.h
//  GQ_IOS_MobileHospital
//
//  Created by Mengying Xu on 14-8-25.
//  Copyright (c) 2014年 Gary. All rights reserved.
//

#import <UIKit/UIKit.h>

//可以点击的label，一行或多行
@protocol CanClickSegmentTextDelegate;

@interface CanClickSegmentText : UIControl

@property (nonatomic,assign)id<CanClickSegmentTextDelegate>delegate;

//一行的宽度，超过则换行
@property (nonatomic)double clickWidth;
@property (strong, nonatomic) NSMutableArray*       items;

//(double)w为一行的宽度
- (void)cellWithItems:(NSArray *)items WithWidth:(double)w;

- (CGFloat)caculateClickTextHeight;

@end

@protocol CanClickSegmentTextDelegate <NSObject>

- (void)clickAction:(NSInteger)index withevent:(id)sender;


@end