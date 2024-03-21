//
//  ReceipeFetcherError.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/18/24.
//

import Foundation

/// Collection of all recipe fetching related errors.
enum RecipeFetcherError: Error {
    /// When network request fails to fetch recipes from all recipes end point.
    case allRecipesFetching(message: String?)
    /// When network request fails to fetch a recipe detail using recipe Id.
    case recipeDetailsFetching(message: String?)
}
