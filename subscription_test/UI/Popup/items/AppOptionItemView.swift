//
//  AppOptionItemView.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct AppOptionItemView: View {
    var channel: AppChannelType
    var isSelected = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(channel.imageName)
                    .padding(.trailing, 10)
                
                Text(channel.rawValue)
                    .font(.Graphik.Regular(of: 16))
                    .foregroundColor(Color(hex: 0x1C1E22))
                
                Spacer()
                
                if isSelected {
                    Image(.imgClick)
                }
            }
            .frame(height: 58)
            
            Divider()
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .background(Color(hex: 0xE6E8EB))
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    AppOptionItemView(channel: .Netflix)
}
