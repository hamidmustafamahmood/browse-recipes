//
//  RequestSender.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// `RequestMaker` implements request maker blue prints and contains helper methods for sending network request.
public class RequestSender: RequestSending {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func sendRequest<Model>(requestMaker: RequestMaking) async throws -> Model where Model : Decodable {
        let urlRequest = try requestMaker.makeRequest()
        let (data, response) = try await urlSession.data(for: urlRequest)
        let _ = try urlRequest.validHTTPRequestResponse(httpResponse: response, data: data)
        return try JSONDecoder().decode(Model.self, from: data)
    }
}
