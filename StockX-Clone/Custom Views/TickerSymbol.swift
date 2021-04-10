//
//  TickerSymbol.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/10/21.
//

import SwiftUI

struct TickerSymbol: View {
    var isUp: Bool
    var tickerName: String
    var amountUp: Int
    let size: CGFloat = 15
    var body: some View {
        ZStack {
            HStack {
                Text(tickerName)
                    .font(.system(size: size))
                    .fontWeight(.bold)
                    .fixedSize(horizontal: true, vertical: false)
                    
                Text("$\(amountUp)")
                    .font(.system(size: size))
                    .fontWeight(.bold)
                    .fixedSize(horizontal: true, vertical: false)
                    
                    .foregroundColor(isUp ? .green : .red)
                
                Image(systemName: "arrowtriangle.up.fill")

                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                    .foregroundColor(isUp ? .green : .red)
            }
        }
        .padding(.horizontal, 10)
        .frame(height: 30)
    }
}

//struct TickerSymbol_Previews: PreviewProvider {
//    static var previews: some View {
//        TickerSymbol(isUp: true)
//    }
//}
