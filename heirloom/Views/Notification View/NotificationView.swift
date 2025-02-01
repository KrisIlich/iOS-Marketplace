//
//  NotificationView.swift
//  heirloom
//
//  Created by Kristopher on 8/30/24.
//

import SwiftUI

struct NotificationView: View {

    @AppStorage("selectedTab") var selectedTab: TabName = .notifications
    @State private var selectedNotification: NotificationItem?
    @State private var showFavoritesCartView = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading,
                   spacing: 0) {
                
                HStack {
                    
                    Text("Notifications")
                        .font(.largeTitle)
                        .foregroundColor(Color(hex: "56666B"))
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        //menu action
                    }) {
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(hex: "#75bba7"))
                    }
                    
                    Button(action: {
                        showFavoritesCartView.toggle()
                    }) {
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(hex: "#75bba7"))
                    }
                    
                }
                .frame(height: 35)
                .padding(.horizontal)
                .padding(.bottom)
                
                Spacer()
                
                
                List {
                    ForEach($notifications) { $notification in
                        NotificationRowView(notification: $notification) {
                                selectedNotification = notification
                            print("ellipsis tapped on selected notification: \(notification.notificationTitle)")
                            }
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
            }
        }
        .sheet(item: $selectedNotification) { notification in
                notificationMenuOptions(notification: notification)
                    .presentationDetents([.fraction(0.40)])
                    .presentationDragIndicator(.visible)
        }
        .fullScreenCover(isPresented: $showFavoritesCartView){
            FavoritesCartView(showCartView: $showFavoritesCartView)
        }
        
    }
    
    
    func notificationMenuOptions(notification: NotificationItem) -> some View {
        VStack(spacing: 16) {
            HStack{
                Image(systemName: "bell.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .padding(.trailing, 8)
                
                Text("Notification Options")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "56666B"))
                
                Spacer()
                
            }
            .padding(.vertical, 20)
            Divider()
                .padding(.bottom)
            
            
            Button(action: {
                if let index = notifications.firstIndex(where: { $0.id == notification.id }) {
                    notifications.remove(at: index)
                    selectedNotification = nil
                }
            }) {
                HStack{
                    Image(systemName: "xmark.rectangle")
                        .resizable()
                        .frame(width: 40, height: 30)
                        .foregroundColor(Color(hex: "56666B"))
                        .fontWeight(.semibold)
                        .padding(.trailing, 8)
                    Text("Remove this Notification")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "56666B"))
                    Spacer()
                }
            }
            
            Button(action: {
                if let index = notifications.firstIndex(where: { $0.id == notification.id }) {
                               notifications[index].isRead = true
                           }
            }) {
                HStack{
                    Image(systemName: "checkmark.rectangle")
                        .resizable()
                        .frame(width: 40, height: 30)
                        .foregroundColor(Color(hex: "56666B"))
                        .fontWeight(.semibold)
                        .padding(.trailing, 8)
                    Text("Mark as read")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "56666B"))
                    Spacer()
                }
            }
            
            
            Button(action: {
                    //action for bug
            }) {
                HStack{
                    Image(systemName: "ladybug")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(hex: "56666B"))
                        .fontWeight(.semibold)
                        .padding(.trailing, 8)
                    Text("Report Notification Bug")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "56666B"))
                    Spacer()
                }
            }
            
            Spacer()
        }
        .padding()
        .background(.white)
        .ignoresSafeArea()
        .cornerRadius(30.0)
    }
    
    @State private var notifications = [
        NotificationItem(
            notificationTitle: "Heirloom System Message",
            notificationType: "Story",
            notificationMessage: "Message regarding recent items sold.",
            notificationDate: Date(),
            iconName: "bell.fill",
            isRead: false
        ),
        NotificationItem(
            notificationTitle: "Your Recent Sale",
            notificationType: "Sale",
            notificationMessage: "Congratulations on your first sale! Find out how you can increase your profits.",
            notificationDate: Date().addingTimeInterval(-1800),  // 30 minutes ago
            iconName: "bell.fill",
            isRead: false
        ),
        NotificationItem(
            notificationTitle: "Antique Super Center",
            notificationType: "Story",
            notificationMessage: "Sent you an offer for your recent posting.",
            notificationDate: Date().addingTimeInterval(-3600),  // 1 hour ago
            iconName: "bell.fill",
            isRead: false
        )
    ]
    
}


struct NotificationRowView: View {
    @Binding var notification: NotificationItem
    var onEllipsisTapped: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "bell.circle.fill")
                .resizable()
                .foregroundColor(Color(hex: "AE8903"))
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
                .padding(.leading)
            
            
            VStack(alignment: .leading) {
                Text(notification.notificationTitle)
                    .font(.headline)
                Text(notification.notificationMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(notification.notificationDate, style: .time)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(height: 75)
            Spacer()
            
    
        Image(systemName: "ellipsis")
            .resizable()
            .frame(width: 25, height: 6)
            .rotationEffect(.degrees(90))
            .foregroundColor(.gray)
            .padding(.trailing)
            .fontWeight(.bold)
            .contentShape(Rectangle())
            .highPriorityGesture(
                TapGesture().onEnded {
                    onEllipsisTapped()
                    print("ellipsis tapped on gesture")
                })
        }
        .padding(.vertical, 16)
        .background(notification.isRead ? Color.white : Color.blue.opacity(0.07))
        .onTapGesture {
            notification.isRead = true
            print("Row tapped")
        }
    }
}



#Preview {
    NotificationView()
        .environmentObject(FavoritesCartViewModel())
        .environmentObject(ItemViewModel(itemId: UUID()))
}
