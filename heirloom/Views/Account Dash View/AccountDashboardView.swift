//
//  AccountDashboardView.swift
//  heirloom
//
//  Created by Kristopher on 8/16/24.
//

import SwiftUI

struct AccountDashboardView: View {
    
    @AppStorage("selectedTab") var selectedTab: TabName = .profile
    
    var body: some View {
        NavigationView {
            VStack {
                header
                    List {
                        profile
                        menu
                    }
                    .padding(.top, -20)
                    .listStyle(.insetGrouped)
                    .navigationBarHidden(true)
            }
            .navigationBarHidden(true)
            .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
    }
}
    
    
    var header: some View {
        HStack {
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color(hex: "#56666B"))
                .bold()
            
            Spacer()
            
            Button(action: {
                // Action for cart to be added
            }) {
                Image(systemName: "envelope.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(hex: "#75bba7"))
            }
            .padding(.trailing, -15)
            
            Button(action: {
                // Action for cart to be added
            }) {
                Image(systemName: "cart.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(hex: "#75bba7"))
                    .padding(.leading, 16)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
    
    var profile: some View {
        VStack(spacing: 0) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial).opacity(0.5))
            Text("Account Name")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("Geo-location")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
        .background(Color.white)
    }
    
    var menu: some View {
        Section {
            NavigationLink { Text("Saved") } label: {
                Label("Saved", systemImage: "heart.fill")
            }
            NavigationLink { Text("Buy Again") } label: {
                Label("Buy again", systemImage: "cart")
            }
            NavigationLink { Text("Purchases") } label: {
                Label("Purchases", systemImage: "creditcard")
            }
            NavigationLink { Text("Bids & Offers") } label: {
                Label("Bids & Offers", systemImage: "dollarsign")
            }
            NavigationLink { Text("Recently Viewed") } label: {
                Label("Recently Viewed", systemImage: "eye")
            }
            Divider()
            NavigationLink { Text("Payments") } label: {
                Label("Payments", systemImage: "link")
            }
            NavigationLink { Text("Help") } label: {
                Label("Help", systemImage: "questionmark")
            }
            NavigationLink { Text("Settings") } label: {
                Label("Settings", systemImage: "gear")
            }
        }
    
        .imageScale(.small)
        .listRowSeparator(.hidden)
        .foregroundColor(Color(hex: "#56666B"))
    }
    
    
    
    



struct AccountDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDashboardView()
    }
}
