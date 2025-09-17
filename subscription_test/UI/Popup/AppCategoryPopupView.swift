//
//  AppPickerPopupView.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct AppCategoryPopupView: View {
    @State var selectedCategory: CategoryType = .Loan
    @Environment(\.safeAreaInsets) var safeAreaInsets
    var action: ((CategoryType)->())? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            contentView
                .frame(height: 352 + safeAreaInsets.bottom)
            
        }
        .ignoresSafeArea()
    }

    var contentView: some View {
        VStack(spacing: 0) {
            PopupTopView(title: "Category", action: {
                action?(selectedCategory)
            })
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(CategoryType.allCases, id: \.self) { category in
                        CategoryOptionItemView(category: category, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
//                                action?(category)
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
}

#Preview {
    AppCategoryPopupView()
}
