//
//  NetworkingClient.swift
//  ASBInterviewExercise
//
//  Created by Dilum De Silva on 2024-07-30.
//

import Foundation

/// Networking client protocol
protocol NetworkingClient {
    func sendRequest<T: Decodable>(apiTarget: BaseAPITarget, responseModel: T.Type) async -> Result<T, NetworkError>
}

extension NetworkingClient {
    /// Base API Request implementation
    func sendRequest<T: Decodable>(apiTarget: BaseAPITarget, responseModel: T.Type) async -> Result<T, NetworkError> {
        #if DEBUG
        if apiTarget.stubbingBehaviour == .immediate {
            guard let path = Bundle.main.url(forResource: apiTarget.stubData, withExtension: Constants.Files.jsonExtensionValue) else {
                fatalError(Constants.Errors.failedToLoadJson)
            }
            
            do {
                let data = try Data(contentsOf: path)
                let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                return .success(decodedResponse)
            } catch {
                return .failure(.decode)
            }
        }
        #endif
        
        var urlComponents = URLComponents()
        urlComponents.scheme = apiTarget.scheme
        urlComponents.host = apiTarget.host
        urlComponents.path = apiTarget.path
        
        guard let url = urlComponents.url else { return .failure(.invalidURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = apiTarget.method.rawValue
       
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            switch response.statusCode {
            case 200:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            default:
                return .failure(.unknown)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
