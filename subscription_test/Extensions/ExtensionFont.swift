//
//  ExtensionFont.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

extension Font {
    
    enum Graphik {
        static func Regular(of size:CGFloat) -> Font { return Font.custom( "Graphik-Regular-Trial", size: size) }
        static func Medium(of size:CGFloat) -> Font { return Font.custom( "Graphik-Medium-Trial", size: size) }
    }
    
}
