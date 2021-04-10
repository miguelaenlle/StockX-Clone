//
//  TabBarView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/9/21.
//

import SwiftUI


enum currentPage { case home, search, profile }

struct TabBarViewIcon: View {
    @Binding var currentSelectedPage: currentPage
    var image: Image
    var iconSize: CGFloat
    var pageName: currentPage
    var body: some View {
        Button(action: {
            currentSelectedPage = pageName
        }, label: {
            image
                .resizable()
                .foregroundColor(currentSelectedPage == pageName ? iconSelectedColor : iconUnselectedColor)
                .frame(width: iconSize, height: iconSize)
        })
        
            

    }
}

struct TabBarView: View {

    let iconSize: CGFloat = 20
    let tolerance: CGFloat = 5
    @Binding var currentSelectedPage: currentPage
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(iconUnselectedColor)
                .frame(height: 1)
            HStack {
                
                TabBarViewIcon(currentSelectedPage: $currentSelectedPage, image: Image("trendingIcon"), iconSize: iconSize, pageName: .home)
                Spacer()
                TabBarViewIcon(currentSelectedPage: $currentSelectedPage, image: Image(systemName: "magnifyingglass"), iconSize: iconSize, pageName: .search)
                Spacer()
                TabBarViewIcon(currentSelectedPage: $currentSelectedPage, image: Image(systemName: "person"), iconSize: iconSize, pageName: .profile)
                
            }
            
            .frame(maxWidth: .infinity)
            .frame(height: iconSize+(tolerance*2))
            .padding(.horizontal, 50)
        }
        .frame(maxWidth: .infinity)
        .frame(height: iconSize+(tolerance*2))
    }
}
//
//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
