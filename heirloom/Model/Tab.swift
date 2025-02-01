//
//  Tab.swift
//  heirloom
//
//  Created by Kristopher on 8/14/24.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tabName: TabName
    var color: Color
}

var tabItems = [
    TabItem(text: "Home", icon: "house", tabName: .home, color: Color(hex: "#AE8903")),
    TabItem(text: "Profile", icon: "person", tabName: .profile, color: Color(hex: "#A69A60")),
    TabItem(text: "Search", icon: "magnifyingglass", tabName: .search, color: Color(hex: "#6D7F64")),
    TabItem(text: "Notifications", icon: "bell", tabName: .notifications, color: Color(hex: "#5D8273")),
    TabItem(text: "Selling", icon: "tag", tabName: .selling, color: Color(hex: "#519D85"))
]

enum TabName: String {
    case home
    case profile
    case search
    case notifications
    case selling
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
