//
//  ViewController.m
//  bi-ios-kvo
//
//  Created by Dominik Vesely on 09/12/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,assign) NSInteger myValue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addObserver:self forKeyPath:@"myValue" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew| NSKeyValueObservingOptionInitial context:0];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:@"bi-ios-notification" object:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    self.myLabel.text = [NSString stringWithFormat:@"%ld", _myValue];
    
}

- (void)dealloc {
    
   // [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
    
    
}

- (void) notificationHandler:(NSNotification*) notification {
    
    NSLog(@"%@",notification);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
  //  [[NSNotificationCenter defaultCenter] postNotificationName:@"bi-ios-notification" object:[NSObject new] userInfo:@{@"name" : @"jendova notifikace lidl tasky"}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)myAction:(UIStepper*)sender {
    
       
    
    [self willChangeValueForKey:@"myValue"];
    _myValue = sender.value;
    [self didChangeValueForKey:@"myValue"];
}

@end
