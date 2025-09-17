//
//  NetflixPriceView.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct NetflixPriceView: View {
    @ObservedObject var viewModel: SubscriptionScreenViewModel
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(viewModel.channelType.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.leading, 20)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.channelType.rawValue)
                    .foregroundColor(Color(hex: 0x1C1E22))
                    .font(.Graphik.Medium(of: 18))
                    .frame(height: 26)
                
                Text("$\(viewModel.amount).00")
                    .foregroundColor(Color(hex: 0x636A79))
                    .font(.Graphik.Regular(of: 16))
                    .frame(height: 22)
                    .padding(.top, 2)
            }
            .padding(.leading, 14)
            
            
            Spacer()
            
        }
        .frame(height: 90)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: 0xD0D5DD), lineWidth: 1)
                )
        )
    }
}

#Preview {
    NetflixPriceView(viewModel: .init())
}
