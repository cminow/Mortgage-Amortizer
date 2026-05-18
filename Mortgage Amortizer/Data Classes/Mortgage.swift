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

    var principal: Double = 500_000
    var interestRate: Double = 0.0675
    var loadTerm: Double = 30
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
