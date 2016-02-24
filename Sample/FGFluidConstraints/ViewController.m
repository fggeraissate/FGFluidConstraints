//
//  ViewController.m
//  FGFluidConstraints
//
//  Created by Fernanda Geraissate on 19/02/16.
//  Copyright © 2016 Fernanda G. Geraissate. All rights reserved.
//

#import "ViewController.h"

#import "NSLayoutConstraint+FGFluidConstraints.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *arrayLabels;
@property (nonatomic, strong) NSArray *arrayColors;
@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self addLabels];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Subviews

- (void)addLabels {
    
    for (UILabel *label in self.arrayLabels) {
        
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:label];
    }
    
    NSArray *arrayConstraints = [NSLayoutConstraint fluidConstraintsWithItems:self.arrayLabels
                                                                   alignAxis:k_FGFC_VERTICAL
                                                              verticalMargin:40.
                                                            horizontalMargin:20.
                                                                 innerMargin:5.];
    
    [self.view addConstraints:arrayConstraints];
    
    [self.view updateConstraints];
    [self.view layoutIfNeeded];
}

#pragma mark - Arrays

- (NSArray *)arrayColors {
    
    if (!_arrayColors) {
        
        _arrayColors = @[[UIColor redColor],
                         [UIColor greenColor],
                         [UIColor blueColor],
                         [UIColor yellowColor],
                         [UIColor orangeColor],
                         [UIColor purpleColor]];
    }
    
    return _arrayColors;
}

- (NSArray *)arrayLabels {
    
    if (!_arrayLabels) {
        
        NSInteger i = 0;
        NSMutableArray *arrayLabels = [NSMutableArray new];
        
        for (UIColor *color in self.arrayColors) {
            
            UILabel *label = [UILabel new];
            
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setBackgroundColor:color];
            [label setText:[NSString stringWithFormat:@"Label %li", i+1]];
            
            [arrayLabels addObject:label];
            
            i++;
        }
        
        _arrayLabels = arrayLabels;
    }
    
    return _arrayLabels;
}

@end
