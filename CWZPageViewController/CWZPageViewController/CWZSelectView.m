//
//  CWZSelectView.m
//  CWZPageViewController
//
//  Created by cwz on 16/11/27.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import "CWZSelectView.h"

@interface CWZSelectView ()
@property(nonatomic,assign)CGFloat allBtnW;
@property(nonatomic,strong)NSArray*titles;
@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,assign)NSInteger perviousIndex;
@end

@implementation CWZSelectView

+(instancetype)instcanceWithTitles:(NSArray *)titles{

    return [[self alloc] initWithTitles:titles];
}


- (instancetype)initWithTitles:(NSArray*)titles{

    if (self==[super init]) {
        _allBtnW = 0;
        _titles = titles;
        _currentIndex = 0;
        _perviousIndex = 0;
        for (int i = 0; i<titles.count; i++) {
      
            NSString *title = titles[i];
            UIButton *btn = [[UIButton alloc] init];
            btn.tag = i;
//            btn.text = title;
//            btn.textAlignment = NSTextAlignmentCenter;
//            btn.textColor = [UIColor blackColor];
//            btn.backgroundColor = [UIColor grayColor];
            [btn setTitle:title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self addSubview:btn];
            [btn addTarget:self action:@selector(clcikBtn:) forControlEvents:UIControlEventTouchUpInside];
            CGFloat btnW = [self btnWithBtn:btn];
          _allBtnW += btnW;
        
        }
    }
    [self clcikBtn:self.subviews[0]];
  
    return self;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    
    CGFloat btnx = 0;
    CGFloat btnW = 0;
    for (int i = 0; i<self.subviews.count; i++) {
        
        UIView *view  = self.subviews[i];
        if (![view isKindOfClass:[UIButton class]]) {
            continue;
        }
        UIButton *btn = (UIButton*)view;
        if (self.allBtnW > self.frame.size.width) {
            self.contentSize = CGSizeMake(_allBtnW, 50);
            btnW = [self btnWithBtn:btn];
            
            
        }else{
            self.contentSize = CGSizeMake(0, 50);
            btnW = self.frame.size.width/self.titles.count;
            btn.frame = CGRectMake(btnx, 0, btnW, self.bounds.size.height);
        }
        btn.frame = CGRectMake(btnx, 0, btnW, self.bounds.size.height);
        btnx = CGRectGetMaxX(btn.frame);
    }
    
    
}

- (CGFloat)btnWithBtn:(UIButton*)btn{

    return [btn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:btn.titleLabel.font}].width+15;
}

- (void)clcikBtn:(UIButton*)btn{
    NSLog(@"currentIndex---%ld",btn.tag);
    [self clickIndex:btn.tag];
    if (self.clickBlock) {
        self.clickBlock(_currentIndex);
    }
    
}

- (void)clickIndex:(NSInteger )index{

    self.perviousIndex = _currentIndex;
    self.currentIndex = index;
    UIButton *btn = self.subviews[index];
    btn.backgroundColor = [UIColor purpleColor];
    UIButton *perviousBtn =  [self.subviews objectAtIndex:_perviousIndex];
    if (btn!=perviousBtn) {
        [perviousBtn setBackgroundColor:[UIColor clearColor]];
    }
    [self canOffsetWithBtn:btn];
}

-(void)setClickSelectTitleBlock:(ClickBlock)clickBlock{

    self.clickBlock = clickBlock;
}


- (void)canOffsetWithBtn:(UIButton*)btn{

    CGFloat maxOffectx = self.contentSize.width - self.frame.size.width;
    CGPoint point = self.contentOffset;
    point = CGPointMake(point.x+self.frame.size.width, 0);
    //相对windows的位置
    CGPoint btnPoint =  [self convertPoint:btn.frame.origin toView:[UIApplication sharedApplication].keyWindow];
    //btn在scorllview的maxX
    CGFloat btnMaxX = btn.frame.origin.x+btn.frame.size.width;
    //点击靠右tap
    CGFloat offsetx = 0;
    if (btnPoint.x>self.frame.size.width/2) {
        //滚动到中间的值 ＝ btnmaxX减去scrollview的宽度再减去scorllview的宽度一半 - 按钮宽度的一半
        offsetx = btnMaxX-self.frame.size.width+self.frame.size.width/2-btn.frame.size.width/2;
        offsetx = offsetx>maxOffectx?maxOffectx:offsetx;
         [self setContentOffset:CGPointMake(offsetx, 0) animated:YES];
    //点击靠左tap
    }else if (btnPoint.x<self.frame.size.width/2){
    offsetx = btn.frame.origin.x-self.frame.size.width+self.frame.size.width/2+btn.frame.size.width/2;
        offsetx =offsetx<0?0:offsetx;
        offsetx = offsetx>maxOffectx?maxOffectx:offsetx;
    [self setContentOffset:CGPointMake(offsetx, 0) animated:YES];
    }
    
    
//    CGFloat  = btn.frame.origin.x+btn.frame.size.width;
//    CGFloat offx = 0;
    
    
//    NSLog(@"currentIndex---%ld",(long)_currentIndex);
//    NSLog(@"_perviousIndex---%ld",(long)_perviousIndex);
//    if (_currentIndex>_perviousIndex) {
//        offx = btnx - self.frame.size.width+self.frame.size.width/2;
//        offx = offx>maxOffectx?maxOffectx:offx;
//            [self setContentOffset:CGPointMake(offx, 0) animated:YES];
//
//    }else if(_currentIndex<_perviousIndex){
//         btnx = btn.frame.origin.x;
//        if (btnx<self.frame.size.width) {
//            [self setContentOffset:CGPointMake(0, 0) animated:YES];
//        }else{
//            btnx = btnx>maxOffectx?maxOffectx:btnx;
//        [self setContentOffset:CGPointMake(btnx, 0) animated:YES];
//        }
//        
//       
//    }

    
    
//    if (btnx>point.x) {
//    [self setContentOffset:CGPointMake(btnx - point.x, 0) animated:YES];
//    }else{
//    [self setContentOffset:CGPointMake(point.x-btnx+self.contentOffset.x, 0) animated:YES];
//    }
    
  
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
