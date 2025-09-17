//
//  SubscriptionFirstOptionsView.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct SubscriptionFirstOptionsView: View {
    @ObservedObject var viewModel: SubscriptionScreenViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            SubscriptionOptionView(title: "App", value: viewModel.channelType.rawValue, type: .ArrowOption, isSwitchOn: .constant(false)) {
                viewModel.presentAppChannel = true
            }
            
            SubscriptionOptionView(title: "Amount", value: "$\(viewModel.amount).00", type: .Price, isSwitchOn: .constant(false)) {
                viewModel.presentAmountPopup = true
            }
            SubscriptionOptionView(title: "Category", value: viewModel.categoryType.rawValue, secondImage: viewModel.categoryType.imageName, type: .ArrowOption, isLast: true, isSwitchOn: .constant(false)) {
                viewModel.presentAppCategory = true
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
    SubscriptionFirstOptionsView(viewModel: .init())
}
