//
//  ExtensionEnvironmentValues.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        UIApplication.shared.keyWindow?.safeAreaInsets.toEdgeInsets ?? EdgeInsets()
    }
}

extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

extension EnvironmentValues {
    private struct MainWindowSizeKey: EnvironmentKey {
        static let defaultValue: CGSize = .init(width: 414, height: 480)
    }

    var mainWindowSize: CGSize {
        get { self[MainWindowSizeKey.self] }
        set { self[MainWindowSizeKey.self] = newValue }
    }

}
