//
//  MealRecipeFetcher.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/18/24.
//

import Foundation

/// Class contains all methods that help in making Recipe fetcher request and manipulating the data.
/// Dependency injection the mechanisim to resolver fetcher related dependencies.
class AllMealsRecipeFetcher: AllMealsRecipeFetching {

    private var dependencyResolver: RecipeFetchingDependencyResolving
    private var requestSender: RequestSending
    
    init(dependencyResolver: RecipeFetchingDependencyResolver) {
        self.dependencyResolver = dependencyResolver
        self.requestSender = dependencyResolver.resolveSendRequest()
    }
    
    func fetchAllMeals(category: String) async throws -> Meals {
        let requestMaker: RequestMaker
        requestMaker = makeRequestToFetchAllMeals(category: category)
        do {
            let allMealsResponse: Meals =  try await requestSender.sendRequest(requestMaker: requestMaker)
            return allMealsResponse
        }
        catch let error {
            throw RecipeFetcherError.allRecipesFetching(message: error.localizedDescription)
        }
    }
    
    /// Making network request
    func makeRequestToFetchAllMeals(category: String) -> RequestMaker {
        var urlComponent = RecipeURL.allMeals.components
        // "c" mean the key of the query param which category of the recipe.
        let queryItem = URLQueryItem(name: "c", value: category)
        urlComponent.queryItems = [queryItem]
        let request = RequestMaker(urlComponents: urlComponent)
        request.assign(httpRequestMethod: .get)
        return request
    }
}
