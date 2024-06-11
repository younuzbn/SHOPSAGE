import SwiftUI

struct ProductView: View {
    var product: Product
    private let columns = [
            GridItem(.flexible(), spacing: 5),
            GridItem(.flexible(), spacing: 5),
            GridItem(.flexible(), spacing: 5)
        ]
    var body: some View {
        LazyVGrid(columns: columns, content: {
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
        
        VStack {
            AsyncImage(url: URL(string: product.images.first ?? "")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                        .padding(.bottom, 8)
                
                } else {
                    ProgressView()
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 8)
                }
            }
            
            Text(product.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(String(format: "$%.2f", product.price))
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 5)
        })
    }
                 
}
