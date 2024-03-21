//
//  RequestMaker.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// `RequestMaker` implements request maker blue prints and contains helper methods for making request.
class RequestMaker: RequestMaking {
    public enum HTTPRequestMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    var urlComponents: URLComponents
    var timeoutInterval: TimeInterval = 25.0
    private(set) var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalCacheData
    private(set) var httpRequestMethod: HTTPRequestMethod = .get
    var body: Data?
    
    init(urlComponents: URLComponents) {
        self.urlComponents = urlComponents
    }
    
    func makeRequest() throws -> URLRequest {
        guard let url = urlComponents.url else  {
            throw NetworkError.invalidRequestURL(reason: urlComponents.debugDescription)
        }
        var urlRequest = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        urlRequest.httpMethod = httpRequestMethod.rawValue
        
        if let body = self.body {
            urlRequest.httpBody = body
        }
        return urlRequest
    }
    
    @discardableResult
    public func assign(httpRequestMethod: HTTPRequestMethod) -> Self {
        self.httpRequestMethod = httpRequestMethod
        return self
    }
}
