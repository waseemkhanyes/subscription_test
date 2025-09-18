//
//  AppPopupView.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct AppChannelPopupView: View {
    @State var selectedChannel: AppChannelType
    @Environment(\.safeAreaInsets) var safeAreaInsets
    var arrayOfChannels: [AppChannelType] = AppChannelType.allCases
    @State var search = ""
    
    var action: ((AppChannelType)->())? = nil
    
    var arrayOfChannelsFiltered: [AppChannelType] {
        if search.isEmpty {
            return arrayOfChannels
        } else {
            return arrayOfChannels.filter { $0.rawValue.localizedCaseInsensitiveContains(search) }
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            contentView
                .frame(height: 580 + safeAreaInsets.bottom)
        }
        .ignoresSafeArea()
    }

    var contentView: some View {
        VStack(spacing: 0) {
            PopupTopView {
                action?(selectedChannel)
            }
            
            searchView
                .padding(.bottom, 8)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(arrayOfChannelsFiltered, id: \.self) { channel in
                        AppOptionItemView(channel: channel, isSelected: channel == selectedChannel)
                            .onTapGesture {
                                self.selectedChannel = channel
                                // The action is now handled by the "done" button in PopupTopView
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
    
    var searchView: some View {
        HStack(spacing: 0) {
            Image(.imgSearch)
                .padding(.leading, 16)
                .padding(.trailing, 10)
            
            TextField("Search", text: $search)
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
        .padding(.top, 12)
    }
}

#Preview {
    AppChannelPopupView(selectedChannel: .Netflix)
}
