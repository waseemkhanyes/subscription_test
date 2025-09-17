//
//  SubscriptionOptionView.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct SubscriptionOptionView: View {
    var title: String
    var value: String
    var secondImage: ImageResource? = nil
    var type: OptionType = .ArrowOption
    var isLast = false
    @Binding var isSwitchOn: Bool
    
    var action: (()->())
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(title)
                        .font(.Graphik.Regular(of: 16))
                        .foregroundColor(Color(hex: 0x636A79))
                    
                    Spacer()
                    
                    if let image = secondImage {
                        Image(image)
                            .padding(.trailing, 5.5)
                    }
                    
                    if type == .Switch {
                        Toggle("", isOn: $isSwitchOn)
                            .toggleStyle(SwitchToggleStyle(tint: Color(hex: 0x65C466)))
                    } else if type == .Date {
                        Text(value)
                            .foregroundColor(Color(hex: 0x1C1E22))
                            .font(.Graphik.Medium(of: 18))
                            .padding(.horizontal, 8)
                            .frame(height: 34)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(hex: 0xF4F4F6))
                            }
                    } else {
                        Text(value)
                            .font(.Graphik.Regular(of: 16))
                            .foregroundColor(Color(hex: 0x1C1E22))
                        
                        if type == .ArrowOption {
                            Image(.unfoldMore)
                                .padding(.leading, 4)
                        }
                    }
                }
                .frame(height: 58)
                
                if !isLast {
                    Divider()
                        .background(Color(hex: 0xE6E8EB))
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                }
                
            }
            .padding(.horizontal, 18)
        }
    }
}

#Preview {
    SubscriptionOptionView(title: "", value: "", isSwitchOn: .constant(false), action: {})
}
