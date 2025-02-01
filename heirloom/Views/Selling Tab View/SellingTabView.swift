//
//  SellingTabView.swift
//  heirloom
//
//  Created by Kristopher on 8/8/24.
//

import SwiftUI

struct SellingTabView: View {
    
    @AppStorage("selectedTab") private var selectedTab: TabName = .selling
    @State private var showFavoritesCartView = false
    @State private var showSellingItemView = false
    
    var body: some View {
            VStack(alignment: .leading,
                   spacing: 0) {
                HStack {
                    
                    Text("Selling")
                        .font(.largeTitle)
                        .foregroundColor(Color(hex: "#56666B"))
                        .bold()
                    
                    Spacer()
        
                    Color.clear
                        .frame(width: 35, height: 35)
                    
                    
                    Button(action: {
                        withAnimation {
                            // action for menu
                        }
                    }) {
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .resizable()
                            .foregroundColor(Color(hex:"#75bba7"))
                            .frame(width: 30, height: 30)
                            .cornerRadius(11)
                    }
                    Button(action: {
                        withAnimation {
                            showFavoritesCartView.toggle()
                        }
                    }) {
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .foregroundColor(Color(hex:"#75bba7"))
                            .frame(width: 30, height: 30)
                            .cornerRadius(11)
                    }
                }
                .frame(height: 35)
                .fullScreenCover(isPresented: $showFavoritesCartView){
                    FavoritesCartView(showCartView: $showFavoritesCartView)
                        .environmentObject(FavoritesCartViewModel())
                }
                .padding(.horizontal)
                .padding(.bottom, 	10)
                
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        if let sellingTabBanner = UIImage(named: "sellingTabBanner") {
                            Image(uiImage: sellingTabBanner)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 5)
                        } else {
                            Text("Banner Image")
                                .foregroundColor(.red)
                        }
                        
                        
                        VStack(alignment: .leading) {
                            
                            Text("90 Day Total")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(Color(hex: "56666B"))
                            
                            Text("{$90 Day Total Here}")
                                .font(.subheadline)
                                .padding(.bottom, 16)
                            
                            Button(action: {
                                showSellingItemView.toggle()
                            }) {
                                Text("List an Item")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .font(.system(size: 18, weight: .bold))
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                                    .padding(.bottom, 30)
                            }
                                    
                            
                            Text("Learn the Basics")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(Color(hex: "56666B"))
                            
                            HStack {
                                
                                Text("1")
                                    .font(.system(size: 35))
                                
                                    .foregroundColor(Color.blue)
                                    .frame(width: 65, height: 65)
                                    .background(Circle().fill(Color.gray.opacity(0.1))).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .padding(.trailing, 15)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("List your item")
                                        .foregroundColor(Color(hex: "#56666B"))
                                        .font(.system(size: 18, weight: .bold))
                                    Text("You can list your used or new antiques or modern furniture")
                                        .foregroundColor(Color.gray)
                                        .font(.system(size: 16))
                                    Text("Learn about our fee's")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(Color(hex:"56666B"))
                                }
                            } .padding(.bottom, 25)
                            
                            
                            
                            HStack {
                                
                                Text("2")
                                    .font(.system(size: 35))
                                
                                    .foregroundColor(Color.blue)
                                    .frame(width: 65, height: 65)
                                    .background(Circle().fill(Color.gray.opacity(0.1))).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .padding(.trailing, 15)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Utilize our state of the art Camera Technology")
                                        .foregroundColor(Color(hex: "#56666B"))
                                        .font(.system(size: 18, weight: .bold))
                                    Text("Utilize our tech of the future built into any mobile device")
                                        .foregroundColor(Color.gray)
                                        .font(.system(size: 16))
                                    Text("Learn about our camera tech")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(Color(hex:"56666B"))
                                }
                            }
                            
                            HStack {
                                
                                Text("3")
                                    .font(.system(size: 35))
                                
                                    .foregroundColor(Color.blue)
                                    .frame(width: 65, height: 65)
                                    .background(Circle().fill(Color.gray.opacity(0.1))).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .padding(.trailing, 15)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Lorem ipsum delorm debus seur")
                                        .foregroundColor(Color(hex: "#56666B"))
                                        .font(.system(size: 18, weight: .bold))
                                    Text("Utilize our tech of the future built into any mobile device")
                                        .foregroundColor(Color.gray)
                                        .font(.system(size: 16))
                                    Text("Learn about our Camera Tech")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(Color(hex:"56666B"))
                                }
                            } .padding(.bottom, 45)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 0)
            }
           .fullScreenCover(isPresented: $showSellingItemView){
               SellingItemView(showSellingItemView: $showSellingItemView)
           }
        }
    }

    
    struct SellingTabView_Previews: PreviewProvider {
        static var previews: some View {
            SellingTabView()
                .environmentObject(FavoritesCartViewModel())
                .environmentObject(ItemViewModel(itemId: UUID()))
        }
    }
