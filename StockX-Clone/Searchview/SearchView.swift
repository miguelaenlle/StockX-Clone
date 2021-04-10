//
//  SearchView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/10/21.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchViewModel = SearchViewModel()
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                TextField("Search by brand, color, etc", text: $searchViewModel.searchText)
                    
                    .font(.system(size: 15))
                    .padding(.horizontal, 10)
                Button(action: {
                    searchViewModel.displayOptions = true
                }) {
                    Image(systemName: "gearshape")
                        .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 0.5)
                .padding(.leading, -20)
                .padding(.top, 15)
//                .padding(.bottom, 0)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            AllCategoriesView(selectedCategory: $searchViewModel.selectedCollection)
                .offset(x: 5)
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, alignment: .leading) {
                    
//                    ItemListingView()
//                        .padding(.bottom, 20)
//                    ItemListingView()
//                        .padding(.bottom, 20)
//                    ItemListingView()
//                        .padding(.bottom, 20)
//                    ItemListingView()
//                        .padding(.bottom, 20)
//                    ItemListingView()
//                        .padding(.bottom, 20)
//                    ItemListingView()
//                        .padding(.bottom, 20)
                }
            }
            .padding(.horizontal, 20)

        }
        .sheet(isPresented: $searchViewModel.displayOptions) {
            FilterView(isPresentingView: $searchViewModel.displayOptions,
                       dismissFilterWithData: { (outputSettings) in
                            searchViewModel.displayOptions = false
                            // reload
                            
                            print(outputSettings)
                       })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
