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

struct TransactionDTO: Codable {
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
    
    var transactionType: TransactionType {
        if credit != 0 {
            return .credit
        } else {
            return .debit
        }
    }
    
    var gst: Double? {
        if transactionType == .debit {
            return debit * Constants.Domain.gstPercentage
        } else {
            return nil
        }
    }
    
    private var date: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.Formatters.dateFormatString
        
        return dateFormatter.date(from: transactionDate) ?? Date()
    }
    
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.Formatters.displayDateFormatString
        return dateFormatter.string(from: date)
    }
}
