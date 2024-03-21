//
//  ServerEnvironment.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// `ServerEnvironment` contains list of all possible environment and is scalable to dev, qa, pilot and more environments.
enum ServerEnvironment: String, ServerEnviornmentGetting {
    enum Constants {
        static let https: String = "https"
    }
    
    case production
    
    public func scheme() -> String {
        switch self {
        case .production:
            return Constants.https
        }
    }
}
