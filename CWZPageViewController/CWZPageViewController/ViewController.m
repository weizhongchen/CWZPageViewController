//
//  ViewController.m
//  CWZPageViewController
//
//  Created by cwz on 16/11/27.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = self.color;
    if (self.color==nil) {
        self.view.backgroundColor = [UIColor greenColor];
    }
    NSLog(@"viewDidLoad---%@",self.titleStr);
    //merge
}


-(void)viewWillAppear:(BOOL)animated{

    NSLog(@"appear---%@",self.titleStr);
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"Disappear---%@",self.titleStr);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
