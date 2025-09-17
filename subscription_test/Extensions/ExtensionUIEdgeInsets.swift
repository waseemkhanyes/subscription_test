//
//  ExtensionUIEdgeInsets.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

extension UIEdgeInsets {
    
    var toEdgeInsets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}

extension EdgeInsets {
    
    static var zero: EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}
