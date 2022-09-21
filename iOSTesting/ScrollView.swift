//
//  ScrollView.swift
//  iOSTesting
//
//  Created by Usha Sai Chintha on 21/09/22.
//

import SwiftUI

struct ScrollView: View {
    var body: some View {
        ScrollView() {
            VStack(spacing: 20){
                    ForEach(0..<10) {
                        Text("Item \($0)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(.red)
                    }
            }
        }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView()
    }
}
