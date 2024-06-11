import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @State private var isCartViewPresented = false

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            FavouritesView()
                .tabItem {
                    Label("", systemImage: "heart.fill")
                }
                .tag(2)
            
            CartTabView(isCartViewPresented: $isCartViewPresented)
                .tabItem {
                    Label("", systemImage: "cart.fill")
                }
                .tag(3)
            
        }
        .popover(isPresented: $isCartViewPresented) {
            CartView()
        }
    }
}

struct CartTabView: View {
    @Binding var isCartViewPresented: Bool
    
    var body: some View {
        Button(action: {
            isCartViewPresented.toggle()
        }) {
            Text("Cart")
        }
        .onAppear{
            isCartViewPresented.toggle()
        }
    }
        
}

struct SearchView: View {
    var body: some View {
        Text("Search View")
    }
}

struct FavouritesView: View {
    var body: some View {
        Text("Favourites View")
    }
}

struct CartView: View {
    var body: some View {
        Text("Cart View")
    }
    
}



#Preview {
    ContentView()
}
