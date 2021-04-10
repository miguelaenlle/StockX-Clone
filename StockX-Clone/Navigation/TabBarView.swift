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
    let tolerance: CGFloat = 30
    @Binding var currentSelectedPage: currentPage
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Rectangle()
                    .foregroundColor(iconUnselectedColor)
                    .frame(height: 1)
                Spacer()
            }
            HStack {
                
                TabBarViewIcon(currentSelectedPage: $currentSelectedPage, image: Image("trendingIcon"), iconSize: iconSize, pageName: .home)
                Spacer()
                TabBarViewIcon(currentSelectedPage: $currentSelectedPage, image: Image(systemName: "magnifyingglass"), iconSize: iconSize, pageName: .search)
                Spacer()
                TabBarViewIcon(currentSelectedPage: $currentSelectedPage, image: Image(systemName: "person"), iconSize: iconSize, pageName: .profile)
                
            }
            .padding(.horizontal, 50)
            .padding(.top, -10)
            
//            }
//            .frame(maxWidth: .infinity)
//            .frame(height: iconSize+(tolerance*2))
        }
        .frame(maxWidth: .infinity)
        .frame(height: iconSize+(tolerance*2))
        .padding(.bottom, -35)
        
        
    }
}
//
//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
