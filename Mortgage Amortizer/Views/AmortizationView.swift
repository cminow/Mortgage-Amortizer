//
//  AmortizationView.swift
//  Mortgage Amortizer
//
//  Created by Charlie Minow on 11/11/25.
//

import SwiftUI

struct AmortizationView: View {
    @State private var mortgage: Mortgage = Mortgage()

    var body: some View {
        VStack {
            Form {
                TextField("Principal Amount:", value: $mortgage.principal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                TextField("Interest Rate:", value: $mortgage.interestRate, format: .percent)
                TextField("Term (years):", value: $mortgage.loadTerm, format: .number)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    AmortizationView()
}
