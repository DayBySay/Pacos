//
//  TSPacosCell.m
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "TSPacosCell.h"

@implementation TSPacosCell

- (id)initWithFrame:(CGRect)frame containerScale:(float)scale contentsView:(UIView*)contentsView
{
    self = [super initWithFrame:frame];
    if (self) {
        // cellの向きと色の設定
        CGAffineTransform t = CGAffineTransformMakeRotation(M_PI_2);
        self.transform = t;
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 実際に表示されるviewの設定
        self.containerFrame = CGRectMake(0,
                                         0,
                                         CGRectGetHeight(frame) * scale,
                                         CGRectGetWidth(frame) * scale);
        self.onContentsView = contentsView;
        self.onContentsView.frame = self.containerFrame;
        self.onContentsView.center = CGPointMake(CGRectGetHeight(frame) / 2,
                                                CGRectGetWidth(frame) / 2);
        [self addSubview:self.onContentsView];

    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - transform

// アニメーションの設定
- (void)setContainerScale:(float)val
{
    float scale = [self scaleForCellDistance:val];
    CGAffineTransform t = CGAffineTransformScale(CGAffineTransformMakeTranslation(0, 0),
                                                  scale,
                                                  scale);
    self.onContentsView.transform = t;
}

# pragma mark - 評価関数

// アニメーション時に利用する、cellのサイズを決める関数
- (float)scaleForCellDistance:(float)theValue
{
    return (1 - fabs(theValue) / 3);
}

@end
