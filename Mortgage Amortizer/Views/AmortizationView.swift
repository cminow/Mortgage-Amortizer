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
            HStack {
                Form {
                    TextField("Principal Amount:", value: $mortgage.principal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    TextField("Interest Rate:", value: $mortgage.interestRate, format: .percent)
                    TextField("Term (years):", value: $mortgage.loanTerm, format: .number)
                    LabeledContent("Monthly Payment:", value: mortgage.monthlyPayment, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .padding([.top] , 4)
                    LabeledContent("Total Interest Payments:", value: mortgage.amortizationSchedule.last?.totalInterest ?? 0.0, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .padding([.top, .bottom] , 4)
                }
                .frame(width: 400)

                Spacer()
            }
            

            Table(mortgage.amortizationSchedule) {
                TableColumn("Month") { item in
                    Text(String(item.month))
                }

                TableColumn("Principal Paid") { item in
                    Text(item.principalPaid, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }

                TableColumn("Interest Paid") { item in
                    Text(item.interestPaid, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }

                TableColumn("Balance") { item in
                    Text(item.remainingBalance, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AmortizationView()
}
