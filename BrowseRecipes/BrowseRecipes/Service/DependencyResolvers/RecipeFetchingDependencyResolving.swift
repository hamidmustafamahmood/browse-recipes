//
//  BaseDependencyResolver.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// Protocol to resolve Recipe related dependencies - A concept to dependency injection.
protocol RecipeFetchingDependencyResolving {
    func resolveAllMealsFetching() -> AllMealsRecipeFetching
    func resolveMealDetailsFetching() -> MealRecipeDetailFetching
    func resolveSendRequest() -> RequestSending
}
