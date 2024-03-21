//
//  URLRequestExtension.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// Extension that validates the network response before proceeding for anything else once the network call is made.
extension URLRequest {
    func validHTTPRequestResponse(httpResponse: URLResponse, data: Data?) throws -> HTTPURLResponse {
        guard let httpResponse = httpResponse as? HTTPURLResponse else {
            throw NetworkError.httpResponseMissing(reason: httpResponse.url?.absoluteString)
        }
        if httpResponse.statusCode == 200, let data = data, !data.isEmpty {
            return httpResponse
        } else {
            throw NetworkError.badRequest(reason: httpResponse.debugDescription)
        }
    }
}
