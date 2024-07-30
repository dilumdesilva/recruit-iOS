//
//  BaseNetworking.swift
//  ASBInterviewExercise
//
//  Created by Dilum De Silva on 2024-07-30.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
}

enum NetworkError: Error {
    case invalidURL
    case noResponse
    case decode
    case unknown
}

/// Enum to handle data mocking behaviour for APIs calls
enum StubbingBehavior {
    case never
    case immediate
}

protocol BaseAPITarget {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var stubbingBehaviour: StubbingBehavior { get }
    var stubData: String { get }
}

extension BaseAPITarget {
    var scheme: String {
        return Constants.API.httpsScheme
    }
    
    var host: String {
        return Constants.API.host
    }
}
