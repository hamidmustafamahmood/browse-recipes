//
//  RequestMaking.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// `RequestMaking` protocol holds blue prints needed to make network request.
protocol RequestMaking {
    func makeRequest() throws -> URLRequest
}
