//
//  MealsListView.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/18/24.
//

import SwiftUI


/// Entry point to display the list of all Recipes and redirecting to the details using `NavigationStack`
struct MealsListView: View {
    @ObservedObject var viewModel: MealsRecipeViewModel
    
    var body: some View {
        NavigationStack {
            List {
                if let allMeals = viewModel.allMeals {
                    ForEach(allMeals.meals.sorted() , id:\.self) { item in
                        NavigationLink(item.mealName) {
                            ScrollView(showsIndicators: false) {
                                VStack(alignment: .leading) {
                                    VStack(alignment: .center) {
                                        Text(item.mealName)
                                            .font(.title)
                                        AsyncImage(
                                            url:  URL(string: item.mealThumbImage),
                                            content: { image in
                                                image.resizable()
                                                    .frame(maxWidth: .infinity, maxHeight: 250, alignment: .center)
                                                    .shadow(color: .gray, radius: 8, x: 0, y: 0)
                                            },
                                            placeholder: {
                                                ProgressView()
                                            }
                                        )
                                    }
                                    .padding()
                                    .padding(.bottom, 24)
                                    if let mealDetails = viewModel.mealDetails {
                                        ForEach(mealDetails.meals.sorted(by: <), id: \.self) { item in
                                            if let instructions = item.instructions {
                                                Text("Instructions\n")
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                Text(AttributedString("\(String(describing: instructions))")
                                                )
                                                .multilineTextAlignment(.leading)
                                                .padding(.bottom, 10)
                                            }
                                            Text("Ingredients\n")
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                                Text(
                                                    "\(String(describing: item.ingredient1 ?? ""))  \(String(describing: item.measurement1 ?? ""))\n\(String(describing: item.ingredient2 ?? ""))  \(String(describing: item.measurement2 ?? ""))\n\(String(describing: item.ingredient3 ?? ""))  \(String(describing: item.measurement3 ?? ""))\n\(String(describing: item.ingredient4 ?? ""))  \(String(describing: item.measurement4 ?? ""))\n\(String(describing: item.ingredient5 ?? ""))  \(String(describing: item.measurement5 ?? ""))\n\(String(describing: item.ingredient6 ?? ""))  \(String(describing: item.measurement6 ?? ""))\n\(String(describing: item.ingredient7 ?? ""))  \(String(describing: item.measurement7 ?? ""))\n\(String(describing: item.ingredient8 ?? ""))  \(String(describing: item.measurement8 ?? ""))\n\(String(describing: item.ingredient9 ?? ""))  \(String(describing: item.measurement9 ?? ""))\n\(String(describing: item.ingredient10 ?? ""))  \(String(describing: item.measurement10 ?? ""))\n\(String(describing: item.ingredient11 ?? ""))  \(String(describing: item.measurement11 ?? ""))\n\(String(describing: item.ingredient12 ?? ""))  \(String(describing: item.measurement12 ?? ""))\n\(String(describing: item.ingredient13 ?? ""))  \(String(describing: item.measurement13 ?? ""))\n\(String(describing: item.ingredient14 ?? ""))  \(String(describing: item.measurement14 ?? ""))\n\(String(describing: item.ingredient15 ?? ""))  \(String(describing: item.measurement15 ?? ""))\n\(String(describing: item.ingredient16 ?? ""))  \(String(describing: item.measurement16 ?? ""))\n\(String(describing: item.ingredient17 ?? ""))  \(String(describing: item.measurement17 ?? ""))\n\(String(describing: item.ingredient18 ?? ""))  \(String(describing: item.measurement18 ?? ""))\n\(String(describing: item.ingredient19 ?? ""))  \(String(describing: item.measurement19 ?? ""))\n\(String(describing: item.ingredient20 ?? ""))  \(String(describing: item.measurement20 ?? ""))"
                                                )
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                    Spacer()
                                }
                                .padding()
                                .onAppear {
                                    Task {
                                        try await viewModel.fetchMealDataById(mealId: item.mealId)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
