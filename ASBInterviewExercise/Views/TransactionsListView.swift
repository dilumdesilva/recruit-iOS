//
//  TransactionListView.swift
//  ASBInterviewExercise
//
//  Created by Dilum De Silva on 2024-07-30.
//

import SwiftUI

struct TransactionsListView: View {
    
    @ObservedObject var viewModel = TransactionsViewModel(store: NetworkingStore())
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.transactions ?? [], id: \.id) { transaction in
                            NavigationLink {
                                TransactionDetailsView(transaction: transaction)
                            } label: {
                                TransactionCardView(transaction: transaction)
                                    .accessibilityElement(children: .combine)
                                    .accessibility(label: Text("Transaction for \(transaction.summary) on \(transaction.displayDate), amount \(transaction.transactionType == .credit ? transaction.credit : transaction.debit, specifier: Constants.Formatters.transactionValueFormatString) dollars"))
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle(Constants.Strings.myTransactions)
                .accessibility(label: Text("My Transactions"))
                .task {
                    await viewModel.getTransactions()
                }
                
                if viewModel.isLoading {
                    ProgressView(Constants.Strings.loading)
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .accessibility(label: Text("Loading transactions"))
                }
            }
        }
    }
}

struct TransactionCardView: View {
    let transaction: TransactionDTO
    
    var body: some View {
        HStack {
            Image(systemName: transaction.transactionType == .credit ? "arrow.down.left" : "arrow.up.forward")
                .foregroundStyle(transaction.transactionType == .credit ? .green : .red)
                .font(.title)
                .accessibility(hidden: true)  // Hides from VoiceOver as it's decorative
            
            VStack(alignment: .leading) {
                Text("$\(transaction.transactionType == .credit ? transaction.credit : transaction.debit, specifier: Constants.Formatters.transactionValueFormatString)")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .accessibility(label: Text("Amount"))
                    .accessibility(value: Text("\(transaction.transactionType == .credit ? transaction.credit : transaction.debit, specifier: Constants.Formatters.transactionValueFormatString) dollars"))
                
                Text("\(transaction.summary)")
                    .foregroundStyle(.gray)
                    .accessibility(label: Text("Summary"))
                    .accessibility(value: Text("\(transaction.summary)"))
                
                Text("\(transaction.displayDate)")
                    .foregroundStyle(.gray)
                    .accessibility(label: Text("Date"))
                    .accessibility(value: Text("\(transaction.displayDate)"))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .font(.title3)
                .accessibility(hidden: true)  // Hides from VoiceOver as it's decorative
        }
        .padding()
        .background(.gray.opacity(0.3))
        .cornerRadius(20)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    TransactionsListView()
}
