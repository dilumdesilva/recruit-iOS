//
//  MockNetworkingStore.swift
//  ASBInterviewExerciseTests
//
//  Created by Dilum De Silva on 2024-07-30.
//

import Foundation

struct MockNetworkingStore: NetworkingClient {
    /// To mock get transactions successful path
    func mockGetTransactionsSuccessful() async -> Result<[TransactionDTO], NetworkError> {
        return await sendRequest(apiTarget: MockAPITarget.getTransactionsSuccessful, responseModel: [TransactionDTO].self)
    }
    
    /// To mock get transactions failure path
    func mockGetTransactionsFailure() async -> Result<[TransactionDTO], NetworkError> {
        return await sendRequest(apiTarget: MockAPITarget.getTransactionsSuccessful, responseModel: [TransactionDTO].self)
    }
}
