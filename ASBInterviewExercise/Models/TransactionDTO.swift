//
//  TransactionDTO.swift
//  ASBInterviewExercise
//
//  Created by Dilum De Silva on 2024-07-30.
//

import Foundation

enum TransactionType: String {
    case credit = "Credit"
    case debit = "Debit"
}

struct TransactionModel: Codable {
    let id : Int
    let transactionDate : String
    let summary : String
    let debit : Double
    let credit : Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case transactionDate
        case summary
        case debit
        case credit
    }
}
