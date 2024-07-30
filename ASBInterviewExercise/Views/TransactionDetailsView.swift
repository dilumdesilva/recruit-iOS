//
//  TransactionDetailsView.swift
//  ASBInterviewExercise
//
//  Created by Dilum De Silva on 2024-07-30.
//

import SwiftUI

struct TransactionDetailsView: View {
    let transaction: TransactionDTO
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    VStack(spacing: 20) {
                        Text("$\(transaction.transactionType == .credit ? transaction.credit : transaction.debit, specifier: Constants.Formatters.transactionValueFormatString)")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                            .accessibility(label: Text("Amount"))
                            .accessibility(value: Text("\(transaction.transactionType == .credit ? transaction.credit : transaction.debit, specifier: Constants.Formatters.transactionValueFormatString) dollars"))
                        
                        HStack {
                            Text("\(transaction.displayDate)")
                                .accessibility(label: Text("Transaction Date"))
                                .accessibility(value: Text("\(transaction.displayDate)"))
                            Spacer()
                            Text("\(transaction.transactionType.rawValue)")
                                .accessibility(label: Text("Transaction Type"))
                                .accessibility(value: Text("\(transaction.transactionType.rawValue)"))
                        }
                    }
                    .padding()
                    .background(transaction.transactionType == .credit ? .green.opacity(0.7) : .red.opacity(0.7))
                    .cornerRadius(20)
                    .accessibilityElement(children: .combine)
                    
                    HStack {
                        Text(Constants.Strings.summary)
                            .accessibility(label: Text("Summary"))
                        Spacer()
                        Text("\(transaction.summary)")
                            .multilineTextAlignment(.trailing)
                            .accessibility(value: Text("\(transaction.summary)"))
                    }
                    
                    if transaction.transactionType == .debit {
                        HStack {
                            Text(Constants.Strings.gst)
                                .accessibility(label: Text("GST"))
                            Spacer()
                            Text("$\(transaction.gst ?? 0, specifier: Constants.Formatters.transactionValueFormatString)")
                                .accessibility(value: Text("\(transaction.gst ?? 0, specifier: Constants.Formatters.transactionValueFormatString) dollars"))
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .accessibilityElement(children: .combine)
            .accessibility(label: Text("Transaction Details"))
        }
        .navigationTitle("Transaction Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        TransactionDetailsView(transaction: TransactionDTO(
            id: 1,
            transactionDate: "2021-08-31T15:47:10",
            summary: "Hackett, Stamm and Kuhn",
            debit: 9379.55,
            credit: 0
        ))
    }
}
