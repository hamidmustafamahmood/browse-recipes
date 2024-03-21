//
//  URLComponentGetting.swift
//  BrowseRecipes
//
//  Created by Hamid Mahmood on 3/19/24.
//

import Foundation

protocol URLComponentGetting: RawRepresentable {
    var components: URLComponents { get }
}
