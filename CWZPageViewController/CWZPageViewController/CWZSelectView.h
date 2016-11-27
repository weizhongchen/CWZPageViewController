//
//  CWZSelectView.h
//  CWZPageViewController
//
//  Created by cwz on 16/11/27.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ClickBlock)(NSInteger index);
@interface CWZSelectView : UIScrollView
@property(nonatomic,copy)ClickBlock clickBlock;

+ (instancetype)instcanceWithTitles:(NSArray*)titles;
- (void)setClickSelectTitleBlock:(ClickBlock)clickBlock;
- (void)clickIndex:(NSInteger )index;
@end
