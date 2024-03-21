//
//  NetworkError.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// List of errors cases will be used for network request failures.
public enum NetworkError: Error {
    case badRequest(reason: String?)
    case invalidRequestURL(reason: String?)
    case httpResponseMissing(reason: String?)
    case requestBodyNotJSONEcodable(reason: String?)
}
