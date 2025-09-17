//
//  AppPickerOptionPopup.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct AppPickerOptionPopup: View {
    var title: String = ""
    @State var selected: String = ""
    var arrayOptions: [String] = []
    @Environment(\.safeAreaInsets) var safeAreaInsets
    var action: ((String)->())? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            contentView
                .frame(height: 236 + safeAreaInsets.bottom)
            
        }
        .ignoresSafeArea()
    }

    var contentView: some View {
        VStack(spacing: 0) {
            PopupTopView(title: title, action: {
                action?(selected)
            })
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(arrayOptions, id: \.self) { text in
                        simpleOptionTitleView(text)
                        .onTapGesture {
                            selected = text
//                            action?(text)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .padding(.bottom, 50)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
        }
    }
    
    func simpleOptionTitleView(_ text: String) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                
                Text(text)
                    .font(.Graphik.Regular(of: 16))
                    .foregroundColor(Color(hex: 0x1C1E22))
                
                Spacer()
                
                if text == selected {
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
    AppPickerOptionPopup()
}
