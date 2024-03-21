//
//  RecipeFetchingDependencyResolver.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// Resolver that implements blue prints to resolve Recipe fetching related dependencies - A concept to dependency injection.
class RecipeFetchingDependencyResolver: RecipeFetchingDependencyResolving {
    func resolveAllMealsFetching() -> any AllMealsRecipeFetching {
        AllMealsRecipeFetcher(dependencyResolver: self)
    }
    
    func resolveMealDetailsFetching() -> MealRecipeDetailFetching {
        MealRecipeDetailsFetcher(dependencyResolver: self)
    }

    func resolveSendRequest() ->  RequestSending {
        RequestSender()
    }
}
