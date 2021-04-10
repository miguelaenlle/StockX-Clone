//
//  FilterViewModel.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/10/21.
//

import Foundation
struct CategoryDescription : Identifiable {
    var id = UUID()
    var criteria: String
    var description: String
}
struct SelectedCategory : Identifiable {
    var id = UUID()
    var categoryName: String
    var displayedCriteria: [CategoryDescription]
}


final class FilterViewModel: ObservableObject {
    @Published var selectedFilter: String = ""
    @Published var presentingFilter: Bool = false
    @Published var sortByCriteria: [String] = []
    
    @Published var selectedCriteria: String = ""
    @Published var selectedCriteriaCategory: String = ""
    @Published var selectedCriteriaOptions: [String: [String: String]] = [:]
    @Published var numCriteriaSelected: Int = 0
    var categories = ["Sort By",
                      "Brands",
                      "Size Types",
                      "Sizes",
                      "Prices",
                      "Release Years"]
    @Published var selectedCriteriaDict: [String: String] =
    [
        "Sort By": "",
        "Brands": "",
        "Size Types": "",
        "Sizes": "",
        "Prices": "",
        "Release Years": ""
    ]
    func clearCriteria() {
        selectedCriteriaDict = [
            "Sort By": "",
            "Brands": "",
            "Size Types": "",
            "Sizes": "",
            "Prices": "",
            "Release Years": ""
        ]
        numCriteriaSelected = 0
    }
    func setCriteriaDict() {
        print(selectedCriteriaCategory)
        print(numCriteriaSelected)
        print(selectedCriteria)
        if selectedCriteria != "" && selectedCriteriaDict[selectedCriteriaCategory] == "" {
            // it was changed from nothing
            numCriteriaSelected += 1
            selectedCriteriaDict[selectedCriteriaCategory] = selectedCriteria
        } else if selectedCriteria == "" && selectedCriteriaDict[selectedCriteriaCategory] != "" {
            // went from something to nothing
            numCriteriaSelected -= 1
            selectedCriteriaDict[selectedCriteriaCategory] = selectedCriteria
        }
        selectedCriteria = ""
        print(selectedCriteriaCategory)
        print(numCriteriaSelected)
        print(selectedCriteria)
    }
    var displayedSortbyCriteria: [String: String] = [
        "Featured": "The 'Featured' picks are chosen specifically for you by the StockX team.",
        "Most Popular": "The 'Most Popular' are the products with the most sales over the past 72 hours.",
        "New Lowest Asks": "The 'New Lowest Asks' are the products with the most recently listed Lowest Asks. These are the products that people are ready to sell.",
        "New Highest Bids": "The 'New Highest Bids' are the products with the most recently listed Highest Bids. These are the products that people are ready to buy.",
        "Average Sale Price": "The average sales price over the past twelve months. We've removed fakes, outliers and auctions with multiple listings.",
        "Total Sold": "The total number of items sold over the past 12 months. We've removed fakes, outliers and auctions with multiple listings.",
        "Volatility": "A measure of how much price fluctuates. It is calculated as standard deviation divided by average price. A $200 product with 40% volatility results in an average price range of $120 to $280.",
        "Price Premium": "A measure of how much more a new, unworn item currently sells for, as compared to its original retail price. An item with a Price Premium of 100% means that the average price of that item right now sells for twice as much as its original retail price.",
        "Last Sale": "The last price this product was sold for.",
        "Lowest Ask": "The lowest price someone is currently selling this product for.",
        "Highest Bid": "The highest price someone is currently offering to pay for this product.",
        "Release Date": "The date this product launched."
    ]
    
    init() {
        var sizesMap: [String: String] = [:]
        for sizeMultiple in 2...(17*2) {
            let size = Float(sizeMultiple) / 2
            print(size)
            
            sizesMap[String(size)] = ""
        }
        var yearMap: [String: String] = ["<2001": ""]
        for year in 2001...2021 {
            yearMap[String(year)] = ""
        }
        var priceMaps: [String: String] = ["Under $100": ""]
        for price in 1...5 {
            let startPrice = (price * 100)
            let endPrice = (price * 100) + 100
            let priceString = "\(startPrice) - \(endPrice)"
            priceMaps[priceString] = ""
        }
        priceMaps["$600 + "] = ""
        
        selectedCriteriaOptions =
        [
            "Sort By": displayedSortbyCriteria,
            "Brands": [
                "Yeezy": "",
                "Air Jordan": "",
                "Off-White": ""
            ],

            "Size Types":  [
                "Men": "",
                "Women": "",
                "Child": "",
                "Preschool": "",
                "Infant": "",
                "Toddler": "",
            ],
            "Prices": priceMaps,
            "Sizes": sizesMap,
            "Release Years": yearMap
        ]
    }
   
    
}
