//
//  ItemListingView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/10/21.
//

import SwiftUI

struct ItemListingView: View {
    var body: some View {
                
        VStack {
            
            Image("nike")
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 160)
            VStack(alignment: .leading) {
                Text("Sony PS5 Playstation 5 ")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.black)
                    
                Text("Lowest Ask ")
                    .font(.system(size: 11))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 1)
                
                Text("$225")
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.black)
                Text("9 minutes ago")
                    .font(.system(size: 11))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 1)

            }
            
            
            Spacer()
        }
        
        .frame(width: 140)
        .frame(height: 240)
        .padding(5)
            

        .cornerRadius(5)
    }
}

struct ItemListingView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListingView()
    }
}
