//
//  NSLayoutConstraint+FGFluidConstraints.m
//  FGFluidConstraints
//
//  Created by Fernanda Geraissate on 19/02/16.
//  Copyright © 2016 Fernanda G. Geraissate. All rights reserved.
//
//  An improved solution written at: http://stackoverflow.com/a/14568394
//

#import "NSLayoutConstraint+FGFluidConstraints.h"

@implementation NSLayoutConstraint (FGFluidConstraints)

+ (NSArray *)fluidConstraintsWithItems:(NSArray *)arrayViews
                             alignAxis:(NSString *)axis
                        verticalMargin:(CGFloat)vMargin
                      horizontalMargin:(CGFloat)hMargin
                           innerMargin:(CGFloat)iMargin {
    
    NSMutableArray *arrayConstraints = [NSMutableArray arrayWithCapacity: arrayViews.count];
    NSMutableDictionary *dictViews = [NSMutableDictionary new];
    BOOL boolIsVertical = [axis isEqualToString:k_FGFC_VERTICAL];
    
    NSMutableString *stringGlobalFormat = [NSMutableString stringWithFormat:@"%@:|-%f-", axis, (boolIsVertical ? vMargin : hMargin)];
    
    for (NSUInteger i = 0; i < arrayViews.count; i++) {
        
        NSString *stringKeyBefore = [NSString stringWithFormat:@"view%td", i-1];
        NSString *stringKey = [NSString stringWithFormat:@"view%td", i];
        
        [dictViews setObject:[arrayViews objectAtIndex:i] forKey:stringKey];
        
        if (i == 0) {
            [stringGlobalFormat appendString:[NSString stringWithFormat: @"[%@]-%f-", stringKey, iMargin]];
            
        } else if (i == arrayViews.count - 1) {
            [stringGlobalFormat appendString:[NSString stringWithFormat: @"[%@(==%@)]-", stringKey, stringKeyBefore]];
            
        } else {
            [stringGlobalFormat appendString:[NSString stringWithFormat: @"[%@(==%@)]-%f-", stringKey, stringKeyBefore, iMargin]];
        }
        
        NSString *stringLocalFormat = [NSString stringWithFormat: @"%@:|-%f-[%@]-%f-|",
                                       boolIsVertical? k_FGFC_HORIZONTAL:k_FGFC_VERTICAL,
                                       boolIsVertical?hMargin:vMargin,
                                       stringKey,
                                       boolIsVertical?hMargin:vMargin];
        
        [arrayConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:stringLocalFormat options:0 metrics:nil views:dictViews]];
    }
    
    NSString *stringAppended;
    
    if (arrayViews.count == 1) {
        stringAppended = @"|";
        
    } else {
        stringAppended = [NSString stringWithFormat:@"%f-|", boolIsVertical ? vMargin : hMargin];
    }
    
    [stringGlobalFormat appendString:stringAppended];
    
    [arrayConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:stringGlobalFormat options:0 metrics:nil views:dictViews]];
    
    return arrayConstraints;
}

@end
