//
//  TransactionViewModel.swift
//  ASBInterviewExercise
//
//  Created by Dilum De Silva on 2024-07-30.
//

import Foundation

@MainActor
final class TransactionsViewModel: ObservableObject {
    let store: NetworkingStore
    
    @Published var transactions: [TransactionDTO]?
    @Published var error: NetworkError?
    @Published var isLoading = false
    
    init(store: NetworkingStore) {
        self.store = store
    }
    
    func getTransactions() async {
        isLoading = true
        let result = await store.getTransactions()
        switch result {
        case .success(let transactions):
            self.transactions = transactions.sorted { $0.date < $1.date }
            isLoading = false
        case .failure(let error):
            self.error = error
            isLoading = false
        }
    }
}
