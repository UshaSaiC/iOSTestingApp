//
//  AddressDetailsView.swift
//  iOSTesting
//
//  Created by Usha Sai Chintha on 09/10/22.
//

import SwiftUI

struct AddressDetailsView: View {
    
    @State private var streetAddress: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var country : String = ""
    @State private var isButtonClicked: Bool = false
    @State private var address: String = ""
    @State var showingCountries = false
    @State private var showingDetail = false
    @ObservedObject var zipCode = NumbersOnly()

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Spacer()
                    Section {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Street Address: ")
                                .font(.headline)
                            TextField("Enter street Address", text: $streetAddress)
                                .padding(.all)
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("City: ")
                                .font(.headline)
                            TextField("Enter city name", text: $city)
                                .padding(.all)
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("State: ")
                                .font(.headline)
                            TextField("Enter state name", text: $state)
                                .padding(.all)
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Country: ")
                                .font(.headline)
                            ZStack {
                                TextField("Select a country", text: $country)
                                    .padding(.all)
                                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                HStack {
                                    Spacer()
                                    Button {
                                        self.showingCountries.toggle()
                                        showingDetail = true
                                    } label: {
                                        Image(systemName: "arrowtriangle.down.fill")
                                            .foregroundColor(.black)
                                            
                                    }
                                    .sheet(isPresented: $showingDetail) {
                                        CountryView(countrySelected: self.$country)
                                        
                                    }
                                }
                                .padding(.horizontal, 5)
                            }
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Zip Code: ")
                                .font(.headline)
                            TextField("Enter zip code", text: $zipCode.value)
                                .padding(.all)
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                .keyboardType(.decimalPad)
                        }
                    }
                    .padding(.horizontal, 15)
                    HStack {
                        Spacer()
                        Button {
                            isButtonClicked = true
                            address = "\(streetAddress), \(city), \(state), \(country), \(zipCode.value)"
                            streetAddress = ""
                            city = ""
                            state = ""
                            zipCode.value = ""
                            country = ""
                        } label: {
                            Text("Address")
                                .background(Color.black)
                                .foregroundColor(.accentColor)
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .frame(height: 100)
                        }
                        .accessibility(label: Text("Address"))
                        .disabled(self.streetAddress == "" || self.city == "" || self.state == "" || self.country == "" || self.zipCode.value == "")
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    if isButtonClicked{
                        Text("Address : \(address)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .accessibility(identifier: "Displays the address")
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal, 15)
                    }
                }
                .navigationBarTitle("Address")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct AddressDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AddressDetailsView()
    }
}
