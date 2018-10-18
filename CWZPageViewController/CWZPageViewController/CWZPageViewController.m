//
//  CWZPageViewController.m
//  CWZPageViewController
//
//  Created by cwz on 16/11/27.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import "CWZPageViewController.h"
#import "CWZSelectView.h"
//22

@interface CWZPageViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView*scrollV;
@property(nonatomic,strong)NSArray*titls;
@property(nonatomic,strong)NSArray*controllers;
@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,assign)NSInteger perviousIndex;
@property(nonatomic,strong)CWZSelectView *selectView;
@property(nonatomic,assign)CGPoint beginOffset;

@end
//22
@implementation CWZPageViewController

+(instancetype)instanceControllers:(NSArray *)controllers andTitles:(NSArray *)titles{
//22
    NSAssert(controllers.count==titles.count, @"标题控制器不相等");
    //444
    return [[self alloc] initWithControllersWithController:controllers andTitles:titles];

    //33

    //22

}

- (instancetype)initWithControllersWithController:(NSArray*)VC andTitles:(NSArray*)titles{
  
//change
    if ([super init]) {
       
        self.controllers = VC;
        self.titls = titles;
        [self setupUI];
        CGSize size = [UIApplication sharedApplication].keyWindow.frame.size;
        [_scrollV setContentSize:CGSizeMake(VC.count*size.width, _scrollV.frame.size.height)];
        _scrollV.pagingEnabled = YES;
        _scrollV.delegate = self;
        self.currentIndex = 0;
        self.perviousIndex = 0;
        [self addVC:VC[0] andIndex:self.currentIndex];
    }
    return self;
}

//change2

- (void)addVC:(UIViewController*)vc andIndex:(NSInteger)index{
//change4

    if (![_scrollV.subviews containsObject:vc.view]) {
       [_scrollV addSubview:vc.view];
        CGRect rect = vc.view.frame;
        rect.origin.x = self.view.frame.size.width*index;
        vc.view.frame = rect;
    }else{
        self.perviousIndex = self.currentIndex;
        self.currentIndex = index;
        UIViewController *perviousVC = self.controllers[self.perviousIndex];
        [perviousVC beginAppearanceTransition:NO animated:NO];
        [perviousVC endAppearanceTransition];
        
        UIViewController *current = self.controllers[self.currentIndex];
        [current beginAppearanceTransition:YES animated:NO];
        [current endAppearanceTransition];
    }
    
    [self.scrollV setContentOffset:CGPointMake(index*self.scrollV.frame.size.width, 0) animated:NO];

}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    self.beginOffset = scrollView.contentOffset;
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
//    NSLog(@"%ld",(long)index);
    
    if (index == self.currentIndex) {
        return;
    }
    [self addVC:self.controllers[index] andIndex:index];
    [self.selectView clickIndex:index];
}

- (void)setupUI{
    __weak typeof(self) weakSelf = self;
//    CGSize size = [UIApplication sharedApplication].keyWindow.frame.size;
    _selectView = [CWZSelectView instcanceWithTitles:self.titls];
    _selectView.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
    [_selectView setClickSelectTitleBlock:^(NSInteger index) {
        [weakSelf addVC:weakSelf.controllers[index] andIndex:index];
    }];
//    UIView *selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    _selectView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_selectView];
    _scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width,self.view.frame.size.height-50)];
    _scrollV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollV];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor blueColor];
//    _scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, 300,300)];
//    _scrollV.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:_scrollV];
}


@end
