//
//  RecipeURL.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// `RecipeURL` contains list of URLs formed using `URLComponent` that will be handy during the development of the project.
enum RecipeURL: String, CaseIterable, URLComponentGetting {
    enum Constants {
        static let fetchRecipesPath: String = "/api/json/v1/1/filter.php"
        static let fetchMealDetailsByIdPath: String = "/api/json/v1/1/lookup.php"
    }
    
    /// Endpoint fetching all recipes.
    case allMeals = "ALL_MEALS"
    /// Endpoint fetching details of a specific recipe.
    case mealDetails =  "MEAL_DETAILS"
    var components: URLComponents {
        switch self {
        case .allMeals:
            return URLComponents(scheme: ServerEnvironment.production.scheme(), hostResource: RecipeResource.recipeProductionAPI.recipeProductionAPIHost, path: Constants.fetchRecipesPath)
        case .mealDetails:
            return URLComponents(scheme: ServerEnvironment.production.scheme(), hostResource: RecipeResource.recipeProductionAPI.recipeProductionAPIHost, path: Constants.fetchMealDetailsByIdPath)
        }
    }
}
