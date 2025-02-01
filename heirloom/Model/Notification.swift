//
//  Notification.swift
//  heirloom
//
//  Created by Kristopher on 8/30/24.
//

import Foundation

struct NotificationItem: Identifiable {
    let id = UUID()
    let notificationTitle: String
    let notificationType: String
    let notificationMessage: String
    let notificationDate: Date
    let iconName: String
    var isRead: Bool
}
