//
//  Constants.swift
//  ASBInterviewExercise
//
//  Created by Dilum De Silva on 2024-07-30.
//

import Foundation

struct Constants {
    
    struct Domain {
        static let gstPercentage = 0.15
    }
    
    struct API {
        static let httpsScheme = "https"
        static let host = "gist.githubusercontent.com"
        static let getTrasactionsPath = "/Josh-Ng/500f2716604dc1e8e2a3c6d31ad01830/raw/4d73acaa7caa1167676445c922835554c5572e82/test-data.json"
    }
    
    struct Files {
        static let mockData = "mock_data"
        static let mockInvalidData = "mock_invalid_data"
        static let jsonExtensionValue = "json"
    }
    
    struct Errors {
        static let failedToLoadJson = "Failed to load JSON"
    }
    
    struct Strings {
        static let myTransactions =  "My Transactions"
        static let summary =  "Summary"
        static let gst = "GST"
        static let loading = "Loading..."
    }
    
    struct Formatters {
        static let dateFormatString = "yyyy-MM-dd'T'HH:mm:ss"
        static let displayDateFormatString = "dd/MM/yyyy HH:mm"
        static let transactionValueFormatString = "%.2f"
    }
    
}
