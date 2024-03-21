//
//  RecipeResource.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// `RecipeResource` contains all the host resources needed to form end point URLs.
enum RecipeResource: String, CaseIterable {
    case recipeProductionAPI = "RecipeProductionAPI"
    
    var recipeProductionAPIHost: String {
        switch self {
        case .recipeProductionAPI:
            return "themealdb.com"
        }
    }
}
