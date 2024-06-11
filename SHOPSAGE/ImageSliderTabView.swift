import SwiftUI

struct ImageSliderTabView: View {
    @State private var currentIndex = 0
    let imageNames = ["1", "2", "3"]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    Image(imageNames[index])
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                        .cornerRadius(10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % imageNames.count
                }
            }
            
            HStack(spacing: 8) {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    Circle()
                        .fill(currentIndex == index ? Color("appColor") : Color.gray)
                        .frame(width: 8, height: 8)
                        .animation(.easeInOut, value: currentIndex)
                }
            }
             // Reduce padding to bring dots closer to the image
        }
        
//        .padding(.horizontal) // Add horizontal padding if needed
    }
}

#Preview {
    ImageSliderTabView()
}
