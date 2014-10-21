//
//  CanClickSegmentText.m
//  GQ_IOS_MobileHospital
//
//  Created by Mengying Xu on 14-8-25.
//  Copyright (c) 2014年 Gary. All rights reserved.
//

#import "CanClickSegmentText.h"

@interface CanClickSegmentText ()


@end
@implementation CanClickSegmentText

- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
        
    }
    return self;
}
- (void)commonInit
{
    _items = [[NSMutableArray alloc] init];

}

- (void)cellWithItems:(NSArray *)items WithWidth:(double)w
{
    [self.items removeAllObjects];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    self.clickWidth = w;//一行的宽度
    [items enumerateObjectsUsingBlock:^(id title, NSUInteger idx, BOOL *stop)
     {
         [self insertSegmentWithTitle:title atIndex:idx animated:NO];
     }];
    
   
}

- (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)segmentIndex animated:(BOOL)animated
{
    
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.numberOfLines = 0;
    lblTitle.lineBreakMode = NSLineBreakByCharWrapping;
    lblTitle.text = title;
    lblTitle.font = [UIFont systemFontOfSize:16];
    lblTitle.textColor = [UIColor blackColor];
    lblTitle.backgroundColor = UIColor.clearColor;
    lblTitle.userInteractionEnabled = YES;
    [lblTitle addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSelectClick:)]];
    [lblTitle sizeToFit];
    lblTitle.textAlignment = NSTextAlignmentCenter;

    NSUInteger index = MAX(MIN(segmentIndex, self.numberOfSegments), 0);
    
    double totalItemWidth = 0.0;
    double totalItemHeight = 0.0;
    double totalItemWidthNewLine = 0.0;

    CGRect lblFrameNew = lblTitle.frame;
    lblFrameNew.size.width += 10;
    lblFrameNew.size.height += 10;
    
    lblTitle.frame = lblFrameNew;
    
    double lastFrameWidth = CGRectGetHeight(lblTitle.frame);

    for (UILabel *item in self.items)
    {
        float itemWidth = CGRectGetWidth(item.frame);
        float itemheight = CGRectGetHeight(item.frame);

        totalItemWidthNewLine += itemWidth;
        
        totalItemWidth += itemWidth;
        totalItemHeight += itemheight;
        
        if(totalItemWidthNewLine+lastFrameWidth >self.clickWidth-10)
        {//若超过一行则换行
            totalItemWidthNewLine = 0.0;
        }
    }

    CGRect lblFrame = lblTitle.frame;

    lblFrame.origin.x += totalItemWidthNewLine;
    UILabel *lastLbl = [self.items lastObject];
    float lastItemY = lastLbl.frame.origin.y;
    
    if(totalItemWidthNewLine == 0.0)
    {//若超过一行则换行
        lblFrame.origin.x = 0.0;
        
        lblFrame.origin.y = lastItemY+CGRectGetHeight(lastLbl.frame);
    }
    else
    {
        lblFrame.origin.y = lastItemY;
    }

    lblTitle.frame = lblFrame;
    
    if (index < self.items.count)
    {
        [self insertSubview:lblTitle belowSubview:self.items[index]];
        [self.items insertObject:lblTitle atIndex:index];
    }
    else
    {
        //新增
        [self addSubview:lblTitle];
        [self.items addObject:lblTitle];
    }

}

//计算cell的高度
- (CGFloat)caculateClickTextHeight
{
    double cellHeightf = 0.0;

    UILabel *nowLbl = (UILabel*)[self.items lastObject];
    
    cellHeightf = nowLbl.frame.origin.y+CGRectGetHeight(nowLbl.frame);
    
    return (cellHeightf+10.0>40.0)?(cellHeightf+10.0):40.0;
}


- (NSUInteger)numberOfSegments
{
    return self.items.count;
}
- (void)handleSelectClick:(UIGestureRecognizer *)gestureRecognizer
{

    if(_delegate && [_delegate respondsToSelector:@selector(clickAction:withevent:)])
    {
        NSInteger index = [self.items indexOfObject:gestureRecognizer.view];
        UILabel *nowLbl = (UILabel*)[self.items objectAtIndex:index];

        [self.delegate clickAction:index withevent:self.items];

    }
}


@end
