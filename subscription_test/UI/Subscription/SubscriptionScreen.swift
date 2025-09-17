//
//  SubscriptionScreen.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

extension View {
    func clearFullScreenCoverBackground() -> some View {
        self.background(
            ClearBackgroundView()
        )
    }
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct SubscriptionScreen: View {
    @StateObject var viewModel = SubscriptionScreenViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.bottom, 20)
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    NetflixPriceView(viewModel: viewModel)
                    
                    SubscriptionFirstOptionsView(viewModel: viewModel)
                    
                    SubscriptionSecondOptionsView(viewModel: viewModel)
                    
                    deleteButton
                        .padding(.top, 20)
                }
                .padding(.horizontal, 16)
            }
        }
        .background(Color(hex: 0xF8F8F8))
        .fullScreenCover(isPresented: $viewModel.presentAppChannel) {
            AppChannelPopupView(selectedChannel: viewModel.channelType, action: viewModel.onClickChannel)
            .clearFullScreenCoverBackground()
        }
        .fullScreenCover(isPresented: $viewModel.presentAppCategory) {
            AppCategoryPopupView(selectedCategory: viewModel.categoryType, action: viewModel.onClickCategory)
            .clearFullScreenCoverBackground()
        }
        .fullScreenCover(isPresented: $viewModel.presentFrequency) {
            AppPickerOptionPopup(title: "Frequency", selected: viewModel.frequency, arrayOptions: ["Weekly", "Monthly", "Anually"], action: viewModel.onClickFrequency)
            .clearFullScreenCoverBackground()
        }
        .fullScreenCover(isPresented: $viewModel.presentRemindMe) {
            AppPickerOptionPopup(title: "Remind Me", selected: viewModel.remindMe, arrayOptions: ["2 days before", "7 days before", "14 days before"], action: viewModel.onClickRemindMe)
            .clearFullScreenCoverBackground()
        }
        .fullScreenCover(isPresented: $viewModel.presentDatePopup) {
            AppDatePopupView(title: "Start date", selected: viewModel.startDate, action: viewModel.onClickDate)
            .clearFullScreenCoverBackground()
        }
        .fullScreenCover(isPresented: $viewModel.presentAmountPopup) {
            AppAmountPopup(title: "Amount", selected: viewModel.amount, action: viewModel.onClickAmount)
            .clearFullScreenCoverBackground()
        }
        
    }
    
    var headerView: some View {
        HStack(spacing: 0) {
            backView
            
            Spacer()
            
            Text("Edit Subscription")
                .foregroundColor(Color(hex: 0x1C1E22))
                .font(.Graphik.Medium(of: 18))
            
            Spacer()
            
            Button(action: {}) {
                Text("Save")
                    .foregroundColor(Color(hex: 0x002FFF))
                    .font(.Graphik.Medium(of: 18))
            }
        }
        .padding(.horizontal, 16)
    }
    
    var backView: some View {
        VStack(spacing: 0) {
            Image(.arrowBack)
       }
       .frame(width: 44, height: 44)
       .background(
           RoundedRectangle(cornerRadius: 22)
               .fill(Color.white)
               .overlay(
                   RoundedRectangle(cornerRadius: 22)
                       .stroke(Color(hex: 0xD0D5DD), lineWidth: 1)
               )
       )
    }
    
    var deleteButton: some View {
        Button(action: {}) {
            VStack(spacing: 0) {
                Text("Delete")
                    .foregroundColor(Color(hex: 0xFF3F3F))
                    .font(.Graphik.Medium(of: 18))
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(hex: 0xD0D5DD), lineWidth: 1)
                    )
            )
        }
    }
}

#Preview {
    SubscriptionScreen()
}
