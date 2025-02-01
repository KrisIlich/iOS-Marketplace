import SwiftUI


struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: TabName = .home
    @State var color: Color = Color(hex: "#AE8903")
    @State var tabItemWidth: CGFloat = 0
    
    var body: some View {
        HStack {
            buttons
        }
        
        .padding(.top, 12)
        .frame(height: 74, alignment: .top)
        .background(.ultraThinMaterial)
        .background(
            background
        )
        .overlay(
            overlay
        )
        
        .frame(maxHeight: .infinity, alignment: .bottom)
        .shadow(color: Color(.gray).opacity(0.2),radius: 5, x: 0, y: 10)
        .ignoresSafeArea()
    }
    
    var overlay: some View {
        HStack {
            if selectedTab == .selling {
                Spacer()
            }
            if selectedTab == .search {}
            if selectedTab == .profile {
                Spacer()
            }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(color)
                .frame(width: tabItemWidth, height: 1)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
                .offset(y: 0.5)
            if selectedTab == .home {
                Spacer()
            }
            if selectedTab == .notifications {
                Spacer()
            }
            if selectedTab == .profile {
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }

    var background: some View {
        HStack {
            if selectedTab == .selling {
                Spacer()
            }
            if selectedTab == .search {   }
            if selectedTab == .profile {
                Spacer()
            }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
                Spacer()
            }
            Circle().fill(color).frame(width: tabItemWidth)
                .opacity(0.6)
            if selectedTab == .home {
                Spacer()
            }
            if selectedTab == .notifications {
                Spacer()
            }
            if selectedTab == .profile {
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(response: 0.09, dampingFraction: 0.75)) {
                    selectedTab = item.tabName
                    color = item.color
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 24)
                        .foregroundColor(selectedTab == item.tabName ? color : .secondary)
                        .padding(.top, 2)
                    
            
                    
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                        .foregroundColor(selectedTab == item.tabName ? color : .secondary)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTab == item.tabName ? .primary : .secondary)
            .blendMode(selectedTab == item.tabName ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) {
                value in
                tabItemWidth = value
                
            }
        }
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(FavoritesCartViewModel())
            .environmentObject(ItemViewModel(itemId: UUID()))
    }
}
