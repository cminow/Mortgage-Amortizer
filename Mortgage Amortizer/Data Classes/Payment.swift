//
//  Payment.swift
//  Mortgage Amortizer
//
//  Created by Charlie Minow on 5/18/26.
//

import Foundation

struct Payment: Identifiable {
    var id: Int {
        return month
    }

    var month: Int
    var totalPayment: Double
    var principalPaid: Double
    var interestPaid: Double
    var remainingBalance: Double
    var totalInterest: Double
}
