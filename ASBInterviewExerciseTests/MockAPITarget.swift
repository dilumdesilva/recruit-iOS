//
//  MockAPITarget.swift
//  ASBInterviewExerciseTests
//
//  Created by Dilum De Silva on 2024-07-30.
//

import Foundation

enum MockAPITarget {
    case getTransactionsSuccessful
    case getTransactionFailure
}

extension MockAPITarget: BaseAPITarget {
    var path: String {
        switch self {
        case .getTransactionsSuccessful:
            return Constants.API.getTrasactionsPath
        case .getTransactionFailure
            return Constants.API.getTrasactionsPath
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getTransactionsSuccessful:
            return .get
        case .getTransactionFailure:
            return .get
        }
    }
    
    var stubbingBehaviour: StubbingBehavior {
        switch self {
        case .getTransactionsSuccessful:
            return .immediate
        case .getTransactionFailure:
            return .immediate
        }
    }
    
    var stubData: String {
        switch self {
        case .getTransactions:
            return Constants.Files.mockData
        case .getTransactionFailure:
            return Constants.Files.mockInvalidData
        }
    }
}
