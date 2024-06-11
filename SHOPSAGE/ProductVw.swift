//
//  ProductVw.swift
//  SHOPSAGE
//
//  Created by Younuz Bin Noushad on 31/05/24.
//

import SwiftUI

struct ProductVw: View {
    var product: Product?
    @StateObject private var vm = ContenteViewModel()
    private let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center){
                LazyVGrid(columns: columns, content: {
                    if (vm.model?.products) != nil {
                        ForEach(vm.model!.products,id:\.id) { i in
                            ZStack{
                                VStack{
                                    AsyncImage(url: URL(string: i.thumbnail)){img in
                                        if let im = img.image {
                                            im
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }else{
                                         Image("imgerr")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
                                    }
                                    Text(i.title)
                                    Text(String(format: "$%.2f", i.price))
                                    
                                }
                                .padding()
                                .frame(height: 300)
                            }
                            .background(Color(.white))
                            
                            .cornerRadius(10)
//                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 5)
//                            .frame(width: UIScreen.main.bounds.width / 2 )
                            
                        }
                        
                    }else{
                        
                    }
                })
            }.frame(width: .infinity)
                .task {
                    await vm.decode()
                }
        }
    }
}

#Preview {
    ProductVw()
}
