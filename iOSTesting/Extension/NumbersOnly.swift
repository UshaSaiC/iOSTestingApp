//
//  NumbersOnly.swift
//  iOSTesting
//
//  Created by Usha Sai Chintha on 10/10/22.
//

import SwiftUI

class NumbersOnly: ObservableObject {
    
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
