//
//  Mortgage.swift
//  Mortgage Amortizer
//
//  Created by Charlie Minow on 5/18/26.
//

import SwiftUI

@Observable
class Mortgage: Codable {
    var id: UUID = UUID()

    var principal: Double = 400_000
    var interestRate: Double = 0.065
    var loanTerm: Double = 30

    var amortizationSchedule: [Payment] {
        var schedule: [Payment] = []
        let payment = monthlyPayment
        let monthlyRate = interestRate / 12
        if loanTerm <= 0 { return schedule }
        let totalMonths = Int(loanTerm * 12)

        var balance = principal
        var totalInterest : Double = 0.0
        
        for month in 1...totalMonths {
            let interestPayment = balance * monthlyRate
            let principalPayment = payment - interestPayment
            balance -= principalPayment
            totalInterest += interestPayment
            
            if balance < 0.0 {
                balance = 0.0
            }
            schedule.append(
                Payment(
                    month: month,
                    totalPayment: payment,
                    principalPaid: principalPayment,
                    interestPaid: interestPayment,
                    remainingBalance: balance,
                    totalInterest: totalInterest
                )
            )
        }
        
        return schedule
    }

    var monthlyPayment: Double {
        let r = interestRate / 12
        let n = loanTerm * 12
        
        let base = pow(1 + r, n)
        let monthlyPayment = principal * r * base / (base - 1)

        return monthlyPayment
    }
}

extension Mortgage: Equatable {
    static func == (lhs: Mortgage, rhs: Mortgage) -> Bool {
        return lhs.id.uuidString == rhs.id.uuidString
    }
}

extension Mortgage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
