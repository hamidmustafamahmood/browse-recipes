//
//  URLComponentExtension.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// Extension that helps in forming a  new url component as needed.
extension URLComponents {
    init(
        scheme: String,
        hostResource: String,
        path: String,
        queryItems: [URLQueryItem]? = nil
    ) {
        var components: URLComponents = URLComponents()
        components.scheme = scheme
        components.host = hostResource
        components.path = path
        components.queryItems = queryItems
        self = components
    }
}
