//
//  NSLayoutConstraint+FluidConstraint.swift
//  FGFluidConstraints
//
//  Created by Renato Matos on 07/07/17.
//  Copyright © 2017 Renato Matos. All rights reserved.
//

import Foundation

extension NSLayoutConstraint {
    
    static func fluidConstraints(arrViews: [UIView], alignAxis: String, vMargin: CGFloat, hMargin: CGFloat, iMargin: CGFloat) -> [NSLayoutConstraint] {
        
        var arrConstraints: [NSLayoutConstraint] = [NSLayoutConstraint](repeating: NSLayoutConstraint(), count: arrViews.count)
        var dictViews: Dictionary<String, UIView> = Dictionary<String, UIView>()
        let isVertical = alignAxis.isEqual("V")
        
        let stringGlobalFormat: NSMutableString = NSMutableString(format: alignAxis + ":|-" + String(describing: isVertical ? vMargin : hMargin) + "-" as NSString)
        
        for (index, view) in arrViews.enumerated() {
            let stringKeyBefore: String = "view" + String(index-1)
            let stringKey: String = "view" + String(index)
            
            dictViews[stringKey] = view
            
            if index==0 {
                stringGlobalFormat.append("[" + stringKey + "]-" + String(describing: iMargin) + "-")
            } else if index == arrViews.count-1 {
                stringGlobalFormat.append("[" + stringKey + "(==" + stringKeyBefore + ")]-")
            } else {
                stringGlobalFormat.append("[" + stringKey + "(==" + stringKeyBefore + ")]-" + String(describing: iMargin) + "-")
            }
            
            let stringLocalFormat = String(isVertical ? "H" : "V") + ":|-" + String(describing: isVertical ? hMargin : vMargin) + "-[" + stringKey + "]-" + String(describing: isVertical ? hMargin : vMargin) + "-|"
            
            arrConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: stringLocalFormat, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictViews as [String : Any]))
        }
        
        var stringAppended: String = ""
        
        if arrViews.count == 1 {
            stringAppended = "|"
        } else {
            stringAppended = String(describing: isVertical ? vMargin : hMargin) + "-|"
        }
        
        stringGlobalFormat.append(stringAppended)
        
        arrConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: stringGlobalFormat as String, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictViews as [String : Any]))
        
        return arrConstraints
        
    }
    
}
