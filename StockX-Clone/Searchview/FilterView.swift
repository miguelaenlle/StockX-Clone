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
    
    @Binding var selectedItemString: String
    
    var description: String?
    var currentItemString: String
    var body: some View {
        
            
        
        VStack(alignment: .leading) {
            Spacer()
            
            HStack {
                if currentItemString == selectedItemString {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundColor(iconSelectedColor)
                }
                Text(currentItemString)
                    .font(.system(size: 15))
                    .foregroundColor(currentItemString == selectedItemString ? iconSelectedColor : .black)
                    .fontWeight(.bold)
                
                Spacer()
                
            }.padding(.horizontal, 20)
            .padding(.top, 10)
            if (description?.count ?? 0) > 0 {
                Text(description ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(currentItemString == selectedItemString ? iconSelectedColor : .gray)
                    .fontWeight(.regular)
                    .padding(.horizontal, 20)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical, 10)
            }
            

            Spacer()
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .foregroundColor(iconUnselectedColor)
        }
            
        
        .frame(maxWidth: .infinity)
        .frame(height: description == "" ? 50 : 150)
        .onTapGesture {
            print(selectedItemString)
            if selectedItemString == currentItemString {
                selectedItemString = ""
            } else {
                selectedItemString = currentItemString
//                    print(selectedItemString)
            }
        }
        
    }
}

struct FilterChangeView: View {
    @State var filterViewModel: FilterViewModel
    @Binding var selectedCriteria: String
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true, content: {
            LazyVStack {
                if let criteriaOptions = filterViewModel.selectedCriteriaOptions[filterViewModel.selectedFilter] {
                    ForEach(criteriaOptions.sorted(by: >), id: \.key) { key, desc in
                        FilterSettingView(selectedItemString: $selectedCriteria, description: desc, currentItemString: key)
                    }
                }
            }
        })
    
        
    }
}
struct FilterSelectView: View {
    
    @State var filterViewModel: FilterViewModel
    var dismissFilterWithData: (([String: String]) -> Void)
    
   
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            LazyVStack {
                ForEach(filterViewModel.categories, id: \.self) { (category) in
                    Button(action: {
                        withAnimation {
                            
                            filterViewModel.selectedCriteriaCategory = category
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
            dismissFilterWithData(filterViewModel.selectedCriteriaDict)
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
    
    var dismissFilterWithData: (([String: String]) -> Void)
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        if filterViewModel.presentingFilter == true {
                            
                            filterViewModel.setCriteriaDict()
                            
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
                HStack {
                    Spacer()
                    if filterViewModel.numCriteriaSelected > 0 && filterViewModel.presentingFilter == false {
                        
                        Text("Clear All (\(filterViewModel.numCriteriaSelected))")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                            .padding(.trailing, 10)
                            .onTapGesture {
                                filterViewModel.clearCriteria()
                            }
                            
                    }
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
                FilterChangeView(filterViewModel: filterViewModel, selectedCriteria: $filterViewModel.selectedCriteria)
            } else {
                FilterSelectView(filterViewModel: filterViewModel, dismissFilterWithData: dismissFilterWithData)
            }
        }
    }
}
//
//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView(isPresentingView: .constant(true))
//    }
//}
