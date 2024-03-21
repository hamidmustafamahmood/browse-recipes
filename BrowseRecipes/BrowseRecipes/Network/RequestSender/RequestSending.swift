//
//  RequestSending.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// `RequestSending` protocol holds blue prints needed to send network request.
protocol RequestSending {
    func sendRequest<Model: Decodable> (requestMaker: RequestMaking) async throws -> Model
}
