//
//  AppAmountPopup.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

import SwiftUI

struct AppAmountPopup: View {
    var title: String = ""
    @State var selected: String = "50"
    var action: ((String)->())? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            contentView
        }
    }
    
    var contentView: some View {
        VStack(spacing: 0) {
            PopupTopView(title: title, action: {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                action?(selected.isEmpty ? "0" : selected)
            })
            .padding(.top, 10)
            .padding(.bottom, 10)
            
            amountFieldView
                .padding(.horizontal, 16)
                .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
    
    var amountFieldView: some View {
        HStack(spacing: 0) {
            Image(.imgMoneySign)
                .padding(.leading, 16)
                .padding(.trailing, 10)
            
            TextField("Amount", text: $selected)
                .keyboardType(.numberPad)
        }
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: 0xD0D5DD), lineWidth: 1)
                )
        )
    }
}

#Preview {
    AppAmountPopup()
}
