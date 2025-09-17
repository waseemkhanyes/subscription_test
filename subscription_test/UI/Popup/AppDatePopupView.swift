//
//  AppDatePopupView.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

struct AppDatePopupView: View {
    var title: String = ""
    @State private var date: Date = Date()
    @State var selected: String = "Apr 12, 2025"
    @Environment(\.safeAreaInsets) var safeAreaInsets
    var action: ((String)->())? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            contentView
                .frame(height: 301 + safeAreaInsets.bottom)
            
        }
        .ignoresSafeArea()
    }
    
    var contentView: some View {
        VStack(spacing: 0) {
            PopupTopView(title: title, action: {
                let formatted = formatDate(date)
                action?(formatted)
            })
            
            DatePicker(
                "",
                selection: $date,
                displayedComponents: .date
            )
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .ignoresSafeArea(.all, edges: .bottom)
        }
        .onAppear {
            if let parsedDate = parseDate(selected) {
                date = parsedDate
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: date)
    }
    
    private func parseDate(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.date(from: string)
    }
}

#Preview {
    AppDatePopupView()
}
