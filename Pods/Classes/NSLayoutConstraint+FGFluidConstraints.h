//
//  NSLayoutConstraint+FGFluidConstraints.h
//  FGFluidConstraints
//
//  Created by Fernanda Geraissate on 19/02/16.
//  Copyright © 2016 Fernanda G. Geraissate. All rights reserved.
//
//  An improved solution written at: http://stackoverflow.com/a/14568394
//

#import <UIKit/UIKit.h>

static NSString *k_FGFC_VERTICAL = @"V";
static NSString *k_FGFC_HORIZONTAL = @"H";

@interface NSLayoutConstraint (FGFluidConstraints)

+ (NSArray *)fluidConstraintsWithItems:(NSArray *)arrayViews
                            alignAxis:(NSString *)axis
                       verticalMargin:(CGFloat)vMargin
                     horizontalMargin:(CGFloat)hMargin
                          innerMargin:(CGFloat)iMargin;

@end
