//
//  CountryView.swift
//  iOSTesting
//
//  Created by Usha Sai Chintha on 09/10/22.
//

import SwiftUI

struct CountryView: View {
    
    @Binding var countrySelected: String
    @Environment(\.presentationMode) var presentationMode
    
    let countryArray: [String] = Locale.isoRegionCodes.compactMap { Locale.current.localizedString(forRegionCode: $0) }
    
    var body: some View {
        List {
            ForEach(countryArray, id: \.self){country in
                Text(country)
                    .onTapGesture {
                        countrySelected = country
                        presentationMode.wrappedValue.dismiss()
                    }
            }
        }
    }
}
