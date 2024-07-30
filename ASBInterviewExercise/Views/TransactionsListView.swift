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
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.transactions ?? [], id: \.id) { transaction in
                        NavigationLink {
                            TransactionDetailsView(transaction: transaction)
                        } label: {
                            TransactionCardView(transaction: transaction)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("My Transactions")
            .task {
                await viewModel.getTransactions()
            }
        }
    }
}

#Preview {
    TransactionsListView()
}

struct TransactionCardView: View {
    let transaction: TransactionDTO
    
    var body: some View {
        HStack {
            Image(systemName: transaction.transactionType == .credit ? "arrow.up.forward" : "arrow.down.left")
                .foregroundStyle(transaction.transactionType == .credit ? .red : .green)
                .font(.title)
            
            VStack(alignment: .leading) {
                Text("\(transaction.transactionType == .credit ? transaction.credit : transaction.debit, specifier: "%.2f")")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Text("\(transaction.summary)")
                    .foregroundStyle(.gray)
                Text("\(transaction.displayDate)")
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .font(.title3)
            
        }
        .padding()
        .background(.gray.opacity(0.3))
        .cornerRadius(20)
    }
}
