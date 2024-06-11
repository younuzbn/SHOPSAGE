//
//  ContentView.swift
//  SHOPSAGE
//
//  Created by Younuz Bin Noushad on 31/05/24.
//

import SwiftUI

struct HomeView: View {
   
    @StateObject private var vm = ContenteViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    
                    
                    Text("SHOPSAGE")
                        .font(.custom("Heavitas", size: 30))
                        .foregroundColor(Color("appColor"))
                    
                    
                    Spacer()
                    Image("profile-picture")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.trailing, 8)
                }

                    ImageSliderTabView()
                        .frame(height: 300)

                HStack {
                    Text("Categories")
                        .font(.custom("Heavitas", size: 20))
                        .padding(.top, 20)
                    
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(["magicmouse", "iphone.gen1", "keyboard", "headphones", "desktopcomputer", "sunglasses"], id: \.self) { imageName in
                            Circle()
                                .fill(Color("appColor"))
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Image(systemName: imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.white)
                                )
                        }
                    }
                    .padding(.top)
                }
//                Spacer()
//                LazyVGrid(columns: columns, content: {
//                   
//                })
                   
                ProductVw()
                    .padding(.top,15)

                

                
            }
            
//            .background(.gray.opacity(0.2))
            
            .padding(.horizontal)
           
        }
        .background(Color.gray.opacity(0.1))
//        .padding()
    }
}


#Preview {
    HomeView()
}
