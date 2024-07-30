//
//  APITarget.swift
//  ASBInterviewExercise
//
//  Created by Dilum De Silva on 2024-07-30.
//

import Foundation

enum APITarget {
    case getTransactions
}

extension APITarget: BaseAPITarget {
    var path: String {
        switch self {
        case .getTransactions:
            return Constants.API.getTrasactionsPath
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getTransactions:
            return .get
        }
    }
    
    var stubbingBehaviour: StubbingBehavior {
        switch self {
        case .getTransactions:
            return .never
        }
    }
    
    var stubData: String {
        switch self {
        case .getTransactions:
            return Constants.Files.mockData
        }
    }
}
