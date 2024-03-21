//
//  ContentView.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: MealsRecipeViewModel = MealsRecipeViewModel(dependencyResolver: .init())
    
    var body: some View {
        VStack {
            MealsListView(viewModel: viewModel)
                .onAppear {
                    Task {
                        try await viewModel.fetchAllMealsByCategory(category: "Dessert")
                    }
                }
        }
    }
}
