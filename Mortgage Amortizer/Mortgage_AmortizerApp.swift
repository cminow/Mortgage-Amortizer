//
//  Mortgage_AmortizerApp.swift
//  Mortgage Amortizer
//
//  Created by Charlie Minow on 11/11/25.
//

import SwiftUI

@main
struct Mortgage_AmortizerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup("Mortgage", for: Mortgage.self) { $mortgageId in
            AmortizationView()
        }
        
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
