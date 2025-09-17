//
//  SubscriptionSecondOptionsView.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct SubscriptionSecondOptionsView: View {
    @ObservedObject var viewModel: SubscriptionScreenViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            SubscriptionOptionView(title: "Start Date", value: viewModel.startDate, type: .Date, isSwitchOn: .constant(false)) {
                viewModel.presentDatePopup = true
            }
            SubscriptionOptionView(title: "Frequency", value: viewModel.frequency, type: .ArrowOption, isSwitchOn: .constant(false)) {
                viewModel.presentFrequency = true
            }
            SubscriptionOptionView(title: "Remind me", value: viewModel.remindMe, type: .ArrowOption, isSwitchOn: .constant(false)) {
                viewModel.presentRemindMe = true
            }
            
            SubscriptionOptionView(title: "Active", value: "", type: .Switch, isLast: true, isSwitchOn: $viewModel.isActive) {
                
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: 0xD0D5DD), lineWidth: 1)
                )
        )
        .padding(.top, 20)
    }
}

#Preview {
    SubscriptionSecondOptionsView(viewModel: .init())
}
