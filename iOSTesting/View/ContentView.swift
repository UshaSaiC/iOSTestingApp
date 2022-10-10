import SwiftUI

struct ContentView: View {
    
    var items = ["Button", "Vertical Scroll", "Horizontal Swipe", "Address Form"]
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Form{
                    Section {
                        NavigationLink(destination: ButtonView()) {
                            Text(items[0])
                                .accessibility(identifier: "Button")
                                .foregroundColor(Color.black)
                                .fontWeight(.medium)
                        }
                        
                        NavigationLink(destination: VerticalScrollView()) {
                            Text(items[1])
                                .accessibility(identifier: "Scroll")
                                .foregroundColor(Color.black)
                                .fontWeight(.medium)
                        }
                        
                        NavigationLink(destination: SwipeView()) {
                            Text(items[2])
                                .accessibility(identifier: "Swipe")
                                .foregroundColor(Color.black)
                                .fontWeight(.medium)
                        }
                    }
                    
                    Section(header: Text("Assignment")) {
                        NavigationLink(destination: AddressDetailsView()) {
                            Text(items[3])
                                .accessibility(identifier: "Address")
                                .foregroundColor(Color.black)
                                .fontWeight(.medium)
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Features")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
