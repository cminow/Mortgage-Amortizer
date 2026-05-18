//
//  Mortgage_AmortizerApp.swift
//  Mortgage Amortizer
//
//  Created by Charlie Minow on 11/11/25.
//

import SwiftUI

@main
struct Mortgage_AmortizerApp: App {
    
    var body: some Scene {
        WindowGroup("Mortgage", for: Mortgage.self) { $mortgageId in
            AmortizationView()
        }
        
    }
}
