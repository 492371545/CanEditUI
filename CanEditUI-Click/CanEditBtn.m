//
//  CanEditBtn.m
//  GQ_Manage_MobileHospital
//
//  Created by Mengying Xu on 14-10-11.
//  Copyright (c) 2014年 Mengying Xu. All rights reserved.
//

#import "CanEditBtn.h"

@interface CanEditBtn()

@property (nonatomic,strong)UIImage *imag;
@property (nonatomic,strong)NSString *titleStr;

@end

@implementation CanEditBtn

- (id)initWithFrame:(CGRect)frame WithTitle:(NSString*)str WithImage:(UIImage*)imag
{
    self = [super initWithFrame:frame];
    if (self) {
      
        [self reloadBtnUIWithTitle:str WithImage:imag];
        [self addTarget:self action:@selector(action:WithEvent:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];

}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];

}

- (void)reloadBtnUIWithTitle:(NSString*)str WithImage:(UIImage*)imag
{
    self.imag = imag;
    self.titleStr = str;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitle:str forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self setImage:self.imag forState:UIControlStateNormal];
    [self sizeToFit];
//    self.imag = imag;
//    self.titleStr = str;
//    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self setTitle:self.titleStr forState:UIControlStateNormal];
//    self.titleLabel.font = [UIFont systemFontOfSize:16];
//
//    [self sizeToFit];//会修改content的bounds,btn的自适应高度为34，实际title自适应的高度为22
    // 放在[self sizeToFit];之后更准确,没有图片时titleLabel的宽度即为自适应的宽度
    
//    CGRect frameTitle = [self titleRectForContentRect:self.titleLabel.frame];
//    
//    CGRect frame2 = self.frame;
//    
//    frame2.size.width += imag.size.width+10;
    
//    self.frame =  frame2;
//    self.titleLabel.frame = frameTitle;
//    CGRect frameImg = [self imageRectForContentRect:frame2];
//    [self setImage:self.imag forState:UIControlStateNormal];
//    self.imageView.frame = frameImg;
}

- (void)action:(id)sender WithEvent:(id)event
{
    
    NSSet *set = [event allTouches];
    UITouch *touch = [set anyObject];
    
    CGPoint currentTouchPosition = [touch locationInView:self];
    
    if(currentTouchPosition.x > self.titleLabel.frame.origin.x+self.titleLabel.frame.size.width-self.imag.size.width-5)
    {//当点击范围在图标范围内时执行该操作
        if(_delegate && [_delegate respondsToSelector:@selector(editBtnAction:)])
        {
            [self.delegate editBtnAction:sender];
        }
    }
    
}

- (CGRect)contentRectForBounds:(CGRect)bounds
{
    return bounds;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    contentRect.origin.x = 0;
    
    return contentRect;
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    contentRect.origin.x = contentRect.size.width-self.imag.size.width-5;
    contentRect.origin.y = (contentRect.size.height-self.imag.size.height)/2;
    contentRect.size.width = self.imag.size.width;
    contentRect.size.height = self.imag.size.height;
    
    return contentRect;
}

@end
