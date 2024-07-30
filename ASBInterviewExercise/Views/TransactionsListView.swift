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
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle(Constants.Strings.myTransactions)
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
            
            VStack(alignment: .leading) {
                Text("$\(transaction.transactionType == .credit ? transaction.credit : transaction.debit, specifier: Constants.Formatters.transactionValueFormatString)")
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

#Preview {
    TransactionsListView()
}


