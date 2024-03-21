//
//  MealsRecipeViewModel.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/18/24.
//

import Foundation

enum LoadState {
    case loaded
    case loading
    case error
}

class MealsRecipeViewModel: ObservableObject {
    let allMealsDataFetcher: AllMealsRecipeFetching
    let mealRecipeDataFetcher: MealRecipeDetailFetching
    let dependencyResolver: RecipeFetchingDependencyResolving
    @Published var allMeals: Meals?
    @Published var mealDetails: MealDetails?
    @Published var loadState: LoadState = .loaded
    
    init(dependencyResolver: RecipeFetchingDependencyResolver) {
        self.dependencyResolver = dependencyResolver
        allMealsDataFetcher = AllMealsRecipeFetcher(dependencyResolver: dependencyResolver)
        mealRecipeDataFetcher = MealRecipeDetailsFetcher(dependencyResolver: dependencyResolver)
    }
    
    @MainActor
    func fetchMealDataById(mealId: String) async throws {
        loadState = .loading
        do {
            mealDetails = try await mealRecipeDataFetcher.fetchMealById(mealId: mealId)
            loadState = .loaded
        }
        catch let error {
            loadState = .error
            throw RecipeFetcherError.allRecipesFetching(message: error.localizedDescription)
        }
    }
    
    @MainActor
    func fetchAllMealsByCategory(category: String)  async throws {
        loadState = .loading
        do {
            allMeals = try await allMealsDataFetcher.fetchAllMeals(category: category)
            loadState = .loaded
        }
        catch let error {
            loadState = .error
            throw RecipeFetcherError.recipeDetailsFetching(message: error.localizedDescription)
        }
    }
}
