//
//  SearchViewModel.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/10/21.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published var selectedCollection = "Sneakers"
    @Published var searchText = ""
    @Published var displayOptions = false
}
