import SwiftUI

struct SwipeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<20) {
                        Text("Item \($0 + 1)")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(Color.accentColor)
                            .accessibility(identifier: "Swipe")
                    }
                }
            }
            .navigationTitle("Horizontal Swipe")
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
