import SwiftUI

struct ButtonView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var isButtonClicked: Bool = false
    @State private var name: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20){
                Spacer()
                
                VStack(spacing : 10) {
                    TextField("First Name", text: $firstName)
                        .font(.system(size: 25))
                    TextField("Last Name", text: $lastName)
                        .font(.system(size: 25))
                }
                .padding(.leading, 10)
                Spacer()
                Button {
                    isButtonClicked = true
                    name = "\(firstName) \(lastName)"
                    firstName = ""
                    lastName = ""
                } label: {
                    Text("Get name")
                        .background(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size: 35))
                        .frame(height: 100)
                }
                Spacer()
                
                if isButtonClicked && name != " "{
                    Text("Name : \(name)")
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .navigationTitle("Button")
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
