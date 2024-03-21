//
//  MealRecipeFetching.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/18/24.
//

import Foundation

protocol AllMealsRecipeFetching {
    func fetchAllMeals(category: String) async throws -> Meals
}
