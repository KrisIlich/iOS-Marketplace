//
//  heirloomApp.swift
//  heirloom
//
//  Created by Kristopher on 7/4/24.
//

import SwiftUI

@main
struct heirloomApp: App {
    @State private var isVideoFinished = false
    @StateObject private var cartViewModel = FavoritesCartViewModel()
    @StateObject private var itemViewModel = ItemViewModel()
    
    var body: some Scene {
        WindowGroup {
            if isVideoFinished {
                ContentView()
                    .environmentObject(cartViewModel)
                    .environmentObject(itemViewModel)
            } else {
                LoadScreenView(isVideoFinished: $isVideoFinished)
                    .ignoresSafeArea()
                    .environmentObject(cartViewModel)
                    .environmentObject(itemViewModel)
            }
        }
    }
}
