//
//  TSPacosCell.h
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSPacosCell : UITableViewCell
@property (nonatomic, strong) UIView *onContentsView;
@property (nonatomic, assign) CGRect containerFrame;

- (id)initWithFrame:(CGRect)frame containerScale:(float)scale contentsView:(UIView*)contentsView;
- (void)setContainerScale:(float)val;

@end
