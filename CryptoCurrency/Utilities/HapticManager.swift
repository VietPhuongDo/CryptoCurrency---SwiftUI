//
//  HapticManager.swift
//  CryptoCurrency
//
//  Created by PhuongDo on 28/04/2023.
//

import Foundation
import SwiftUI

class HapticManager{
    static private let generator = UINotificationFeedbackGenerator()
    static func notification(type:UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
