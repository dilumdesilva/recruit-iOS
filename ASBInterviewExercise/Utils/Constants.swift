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
        static let jsonExtensionValue = "json"
    }
    
    struct Error {
        static let failedToLoadJson = "Failed to load JSON"
    }
    
}
