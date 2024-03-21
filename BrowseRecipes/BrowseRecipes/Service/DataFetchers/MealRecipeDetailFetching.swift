//
//  MealRecipeDetailFetching.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

protocol MealRecipeDetailFetching {
    func fetchMealById(mealId: String) async throws -> MealDetails
}
