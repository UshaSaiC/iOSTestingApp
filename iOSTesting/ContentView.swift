//
//  ContentView.swift
//  iOSTesting
//
//  Created by Usha Sai Chintha on 21/09/22.
//

import SwiftUI

struct ContentView: View {
    
    var items = ["Button", "Vertical Scroll", "Horizontal Swipe"]
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                List{
                    NavigationLink(destination: ButtonView()) {
                        Text(items[0])
                            .foregroundColor(Color.black)
                            .fontWeight(.medium)
                    }
                    
                    NavigationLink(destination: VerticalScrollView()) {
                        Text(items[1])
                            .foregroundColor(Color.black)
                            .fontWeight(.medium)
                    }
                    
                    NavigationLink(destination: SwipeView()) {
                        Text(items[2])
                            .foregroundColor(Color.black)
                            .fontWeight(.medium)
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
