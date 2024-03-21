//
//  Meals.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/18/24.
//

import Foundation

// MARK: - Meals
struct Meals: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable, Hashable, Comparable {
    static func < (lhs: Meal, rhs: Meal) -> Bool {
        lhs.mealName < rhs.mealName
    }
    
    let mealName: String
    let mealThumbImage: String
    let mealId: String
    
    enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case mealThumbImage = "strMealThumb"
        case mealId = "idMeal"
    }
}
