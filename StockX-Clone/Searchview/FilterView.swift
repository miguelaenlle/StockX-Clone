//
//  FilterView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/10/21.
//

import SwiftUI
struct FilterCriteriaView: View {
    var nameOfCriteria: String
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(nameOfCriteria)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                
            }.padding(.horizontal, 20)
            Spacer()
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }
}
struct FilterSettingView: View {
    var nameOfCriteria: String
    @Binding var selectedItemString: String?
    @Binding var currentItemString: String
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                if selectedItemString == currentItemString {
                    selectedItemString = nil
                } else {
                    selectedItemString = currentItemString
                }
                
            }, label: {
                HStack {
                    if currentItemString == selectedItemString {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(iconSelectedColor)
                    }
                    Text(nameOfCriteria)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer()
                    
                }.padding(.horizontal, 20)
                Spacer()
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .foregroundColor(currentItemString == selectedItemString ? iconSelectedColor : Color.black)
            })
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }
}

struct FilterChangeView: View {
    @State var filterViewModel: FilterViewModel
    var body: some View {
        
    }
}
struct FilterSelectView: View {
    @State var filterViewModel: FilterViewModel
    var categories = ["Sort By",
                      "Product Category",
                      "Brands",
                      "Size Types",
                      "Sizes",
                      "Prices",
                      "Release Years"]
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            LazyVStack {
                ForEach(categories, id: \.self) { (category) in
                    Button(action: {
                        withAnimation {
                            filterViewModel.presentingFilter = true
                            filterViewModel.selectedFilter = category
                        }
                    }, label: {
                        FilterCriteriaView(nameOfCriteria: category)
                    })
                }
            }
        })
        Spacer()
        Button(action: {
            
        }, label: {
            ZStack {
                Color.green
                VStack {
                    Spacer()
                    
                    Text("View Results")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .frame(height: 50)
            
        })
    }
}
struct FilterView: View {
    @Binding var isPresentingView: Bool
    @ObservedObject var filterViewModel = FilterViewModel()
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        if filterViewModel.presentingFilter == true {
                            withAnimation {
                                filterViewModel.presentingFilter = false
                            }
                        } else {
                            // dismiss the view
                            withAnimation {
                                isPresentingView = false
                            }
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                        
                    })
                    
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(filterViewModel.presentingFilter && filterViewModel.selectedFilter != nil ? filterViewModel.selectedFilter ?? "Filters" : "Filters")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                    Spacer()
                }
            }
            .frame(height: 20)
            .frame(maxWidth: .infinity)
            .padding()
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            if filterViewModel.presentingFilter && filterViewModel.selectedFilter != nil {
                FilterChangeView()
            } else {
                FilterSelectView(filterViewModel: filterViewModel)
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isPresentingView: .constant(true))
    }
}
