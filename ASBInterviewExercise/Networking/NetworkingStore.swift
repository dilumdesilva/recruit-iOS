//
//  NetworkingStore.swift
//  ASBInterviewExercise
//
//  Created by Dilum De Silva on 2024-07-30.
//

import Foundation


struct NetworkingStore: NetworkingClient {
    /// To fetch transactions related details
    func getTransactions() async -> Result<[TransactionDTO], NetworkError> {
        return await sendRequest(apiTarget: APITarget.getTransactions, responseModel: [TransactionDTO].self)
    }
}
