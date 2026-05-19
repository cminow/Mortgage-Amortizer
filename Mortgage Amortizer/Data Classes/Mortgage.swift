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

    // This gets around an "Immutable property will not be decoded" error in the generated code
    //   (by more or less explicitly ignoring the _$observationRegistrar property
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _principal = "principal"
        case _interestRate = "interestRate"
        case _loanTerm = "loanTerm"
//        case _observationRegistrar // This is the offending key that must be ignored
    }
    
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
