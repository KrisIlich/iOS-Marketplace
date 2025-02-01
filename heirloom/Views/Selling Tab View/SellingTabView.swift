//
//  SellingTabView.swift
//  heirloom
//
//  Created by Kristopher on 8/8/24.
//

import SwiftUI

struct SellingTabView: View {
    @AppStorage("selectedTab") private var selectedTab: TabName = .selling
    @State private var showCartView = false
    
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
                            showCartView.toggle()
                        }
                    }) {
                        Image(systemName: "cart.circle.fill")
                            .resizable()
                            .foregroundColor(Color(hex:"#75bba7"))
                            .frame(width: 30, height: 30)
                            .cornerRadius(11)
                    }
                }
                .fullScreenCover(isPresented: $showCartView){
                    CartView(viewModel: CartViewModel(cart: MockData.sampleCart), showCartView: $showCartView)
                }
                .padding(.horizontal)
                .padding(.bottom, 	20)
                
                
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
                        
                        VStack {
                            Text("Learn the Basics")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(Color(hex: "56666B"))
                        } 
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            
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
                            } .padding(.bottom, 25)
                            
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
                            } .padding(.bottom, 25)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 0)
            }
        }
    }

    
    struct SellingTabView_Previews: PreviewProvider {
        static var previews: some View {
            SellingTabView()
        }
    }
