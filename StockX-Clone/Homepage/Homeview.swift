//
//  Homeview.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/9/21.
//

import SwiftUI
struct CategoryView: View {
    var categoryName: String
    @Binding var selectedCategory: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(categoryName)
                .font(.system(size: 15))
                .fontWeight(.bold)
//                .font(Font.custom("BrutaProExtended-SemiBold", size: 15))
                .foregroundColor(selectedCategory == categoryName ? .black : .gray)
                .fixedSize(horizontal: true, vertical: false)
                .onTapGesture {
                    withAnimation {
                        selectedCategory = categoryName
                    }
                }
            Rectangle()
                .foregroundColor(selectedCategory == categoryName ? .green : .clear)
                .frame(width: 80)
                .frame(height: 2)
                
            
        }
    }
}
struct AllCategoriesView: View {
    @Binding var selectedCategory: String
    var categories: [String] = ["Sneakers", "Streetwear", "Electronics"]
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(categories, id: \.self) { (category) in
                        CategoryView(categoryName: category, selectedCategory: $selectedCategory)
                    }

                }
                
                .frame(maxWidth: .infinity)
                .frame(height: 50)
    //            .padding(.horizontal, 100)
            }
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 0.5)
                .padding(.leading, -20)
                .padding(.top, -17)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        }
        
    }
}
struct CategoryImages: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
            
                CategoryImageView()
                CategoryImageView()
                CategoryImageView()
                
            }
        }
        .padding(.leading, 20)
        .padding(.bottom, 30)
    }
}
struct CategoryHeader: View {
    var currentName: String
    var body: some View {
        VStack {
            HStack {
                Text(currentName)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    print()
                    // redirect to a search view w/ certain criteria
                    // ill have to add a ton of test listings
                }, label: {
                    HStack {
                        Text("See all")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                        
                        Image(systemName: "chevron.right")

                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                })
            }
        }.padding(.horizontal, 20)
        
    }
}
struct MainCategory: View {
    var currentName: String
    var body: some View {
        VStack {
            CategoryHeader(currentName: currentName)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {}, label: {
                        ItemListingView()
                    })
                    
                }.padding(.horizontal, 20)
            }
        }
        .padding(.bottom, 30)
    }
}
struct Homeview: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        VStack {
                            
                            TickerScrollView()
                                .frame(width: geo.size.width)
                            Spacer()
                                
                        }
                        
                    }
                    Rectangle()

                        .frame(height: 150)
                        .foregroundColor(.gray)
                    VStack {
                       
                        AllCategoriesView(selectedCategory: $homeViewModel.selectedCollection)
                            .offset(x: 20)
                        VStack {
                            CategoryHeader(currentName: "Popular brands")
                            CategoryImages()
                            MainCategory(currentName: "Most Popular")
                            MainCategory(currentName: "New Lowest Asks")
                            MainCategory(currentName: "New Highest Bids")
                            
                        }
                        .padding(.top, 10)
                    
                }
            }
        
        //        .background(EmptyView())
        }
        
    }
}
}
    

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
