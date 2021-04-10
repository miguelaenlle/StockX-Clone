//
//  CategoryImageView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/10/21.
//

import SwiftUI

struct CategoryImageView: View {
    var body: some View {
        ZStack {
            Color.gray
            Image("nike")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                
            VStack {
                HStack {
                    Spacer()
                    Image("nikelogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .cornerRadius(5)
                        
                }
                .padding(.trailing, 20)
                .frame(height: 20)
                Spacer()
            }
            
            
            
            
        }
        .frame(width: 140, height: 110)
        .cornerRadius(5)
    }
}

struct CategoryImageView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImageView()
    }
}
