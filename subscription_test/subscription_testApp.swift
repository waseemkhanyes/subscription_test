//
//  subscription_testApp.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

@main
struct subscription_testApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { proxy in
                subscriptionView
                    .environment(\.mainWindowSize, proxy.size)
            }
        }
    }
    
    var subscriptionView: some View {
        SubscriptionScreen()
    }
}
