//
//  HttpClient.swift
//  Weather
//
//  Created by Влад Лялькін on 10.05.2024.
//

import Foundation

enum HttpError: Error {
    case badURL, badResponse, errorDecodingData
}

class HttpClient {
    private init() {}

    static let shared = HttpClient()
    
    func fetch<T: Codable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print(response as Any)
            throw HttpError.badResponse
        }
        
        guard let weather = try? JSONDecoder().decode(T.self, from: data) else {
            throw HttpError.errorDecodingData
        }
        
        return weather
    }
}
