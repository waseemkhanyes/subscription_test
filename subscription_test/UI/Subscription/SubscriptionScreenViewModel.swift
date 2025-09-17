//
//  SubscriptionScreenViewModel.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import Foundation
import DeveloperToolsSupport

enum OptionType {
    case ArrowOption, Price, Date, Switch
}

enum AppChannelType: String, CaseIterable {
    case Netflix = "Netflix"
    case Spotify = "SpotiFy"
    case NYT = "New Your Times"
    case WSJ = "Wall Street Journal"
    case Hulu = "Hulu"
    case Apple = "Apple"
    case Amazon = "Amazon"
    case Chess = "Chess"
    
    var imageName: ImageResource {
        switch self {
        case .Netflix:
                .imgNetflix
        case .Spotify:
                .imgSpotify
        case .NYT:
                .imgNewYourk
        case .WSJ:
                .imgWSJ
        case .Hulu:
                .imgHulu
        case .Apple:
                .imgApple
        case .Amazon:
                .imgAmazon
        case .Chess:
                .imgChess
        }
    }
}

enum CategoryType: String, CaseIterable {
    case Subscription = "Subscription"
    case Utitlity = "Utitlity"
    case CardPayment = "Card Payment"
    case Loan = "Loan"
    case Rent = "Rent"
    
    var imageName: ImageResource {
        switch self {
        case .Subscription:
                .autorenew
        case .Utitlity:
                .imgBuild
        case .CardPayment:
                .creditCard
        case .Loan:
                .monetizationOn
        case .Rent:
                .imgHome
        }
    }
}

//struct OptionData {
//    var id: Int
//    var title: String = ""
//    var detail: String = ""
//    var type: OptionType
//    var secondImage: ImageResource? = nil
//    var optionValue = ""
//    var switchValue = false
//    var isLast = false
//}

class SubscriptionScreenViewModel: ObservableObject {
    
    @Published var channelType: AppChannelType = .Netflix
    @Published var amount: String = "50"
    @Published var categoryType: CategoryType = .Loan
    @Published var startDate: String = "Apr 12, 2025"
    @Published var frequency: String = "Weekly"
    @Published var remindMe: String = "2 days before"
    @Published var isActive: Bool = true
    
    
    @Published var presentAppChannel: Bool = false
    @Published var presentAppCategory: Bool = false
    @Published var presentFrequency: Bool = false
    @Published var presentRemindMe: Bool = false
    @Published var presentDatePopup: Bool = false
    @Published var presentAmountPopup: Bool = false
    
    
    func onClickChannel(channel: AppChannelType) {
        presentAppChannel = false
        channelType = channel
    }
    
    func onClickCategory(frequency: CategoryType) {
        presentAppCategory = false
        categoryType = frequency
    }
    
    func onClickFrequency(selected: String) {
        presentFrequency = false
        frequency = selected
    }
    
    func onClickRemindMe(selected: String) {
        presentRemindMe = false
        remindMe = selected
    }
    
    func onClickDate(selected: String) {
        presentDatePopup = false
        startDate = selected
    }
    
    func onClickAmount(selected: String) {
        presentAmountPopup = false
        amount = selected
    }
    
    
}
