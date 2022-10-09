import SwiftUI

struct VerticalScrollView: View {
    var body: some View {
        NavigationView {
            ScrollView() {
                VStack(spacing: 20){
                    ForEach(0..<20) {
                        Text("Item \($0 + 1)")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(Color.accentColor)
                            .accessibility(identifier: "Scroll")
                    }
                }
            }
            .navigationTitle("Vertical Scroll")
            
        }
    }
}

struct VerticalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalScrollView()
    }
}
