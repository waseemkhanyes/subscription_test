//
//  PopupTopView.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct PopupTopView: View {
    var title: String = "App"
    var action: (()->())
    
    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 3)
                .fill(Color(hex: 0xDBDDE2))
                .frame(width: 38, height: 6)
                .padding(.top, 6)
            
            
            ZStack {
                Text(title)
                    .font(.Graphik.Medium(of: 18))
                    .foregroundColor(Color(hex: 0x1C1E22))

                HStack(spacing: 0) {
                    Spacer()
                    
                    Button(action: action) {
                        Text("Done")
                            .font(.Graphik.Medium(of: 18))
                            .foregroundColor(Color(hex: 0x002FFF))
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    PopupTopView(action: {})
}
