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
        VStack {
            VStack(alignment: .leading) {
                VStack(spacing: 20) {
                    Text("$\(transaction.transactionType == .credit ? transaction.credit : transaction.debit, specifier: Constants.Formatters.transactionValueFormatString)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                    
                    HStack {
                        Text("\(transaction.displayDate)")
                        Spacer()
                        Text("\(transaction.transactionType.rawValue)")
                    }
                }
                .padding()
                .background(transaction.transactionType == .credit ? .green.opacity(0.7) : .red.opacity(0.7))
                .cornerRadius(20)
                
                HStack {
                    Text(Constants.Strings.summary)
                    Spacer()
                    Text("\(transaction.summary)")
                        .multilineTextAlignment(.trailing)
                }
                
                if transaction.transactionType == .debit {
                    HStack {
                        Text(Constants.Strings.gst)
                        Spacer()
                        Text("$\(transaction.gst ?? 0, specifier: Constants.Formatters.transactionValueFormatString)")
                    }
                }
                
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    TransactionDetailsView(transaction: TransactionDTO(
        id: 1,
        transactionDate: "2021-08-31T15:47:10",
        summary: "Hackett, Stamm and Kuhn",
        debit: 9379.55,
        credit: 0
    ))
}

