//
//  EntryView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/9/21.
//

import SwiftUI

struct EntryView: View {
    @State var currentSelectedPage: currentPage
    var body: some View {
        ZStack {
            switch currentSelectedPage {
                case .home: Text("Home")
                case .search: Text("Search")
                case .profile: Text("Profile")
            }
            VStack {
                Spacer()
                TabBarView(currentSelectedPage: $currentSelectedPage)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//struct EntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryView()
//
//    }
//}
