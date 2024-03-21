//
//  MealRecipeDetailsFetcher.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

/// Class contains all methods that help in making Recipe details fetcher request and manipulating the data.
/// Dependency injection the mechanisim to resolver fetcher related dependencies.
class MealRecipeDetailsFetcher: MealRecipeDetailFetching {
    
    private var dependencyResolver: RecipeFetchingDependencyResolving
    private var requestSender: RequestSending
    
    init(dependencyResolver: RecipeFetchingDependencyResolver) {
        self.dependencyResolver = dependencyResolver
        self.requestSender = dependencyResolver.resolveSendRequest()
    }
    
    func fetchMealById(mealId: String) async throws -> MealDetails {
        let requestMaker: RequestMaker
        requestMaker = makeRequestToFetchMealDetails(mealId: mealId)
        do {
            let mealDetailsResponse: MealDetails =  try await requestSender.sendRequest(requestMaker: requestMaker)
            return mealDetailsResponse
        }
        catch let error {
            throw RecipeFetcherError.recipeDetailsFetching(message: error.localizedDescription)
        }
    }
    
    /// Making network request 
    func makeRequestToFetchMealDetails(mealId: String) -> RequestMaker {
        var urlComponent = RecipeURL.mealDetails.components
        // "c" mean the key of the query param which category of the recipe.
        let queryItem = URLQueryItem(name: "i", value: mealId)
        urlComponent.queryItems = [queryItem]
        let request = RequestMaker(urlComponents: urlComponent)
        request.assign(httpRequestMethod: .get)
        return request
    }
}
