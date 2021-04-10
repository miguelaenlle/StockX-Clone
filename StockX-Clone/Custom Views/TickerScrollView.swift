//
//  TickerScrollView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/9/21.
//

import SwiftUI

struct TickerScrollView: View {
    @State var scrollText: Bool = false
    var body: some View {
        ZStack {
            HStack(alignment: .top, spacing: 1, content: {
                TickerSymbol(isUp: true,
                             tickerName: "Test test",
                             amountUp: 250)
                    .frame(maxWidth: .infinity)
                TickerSymbol(isUp: true,
                             tickerName: "Test test",
                             amountUp: 250)
                    .frame(maxWidth: .infinity)
                TickerSymbol(isUp: true,
                             tickerName: "Test test",
                             amountUp: 250)
                    .frame(maxWidth: .infinity)
                TickerSymbol(isUp: true,
                             tickerName: "Test test",
                             amountUp: 250)
                    .frame(maxWidth: .infinity)
                
            })
//            .frame(maxWidth: .infinity)
            .offset(x: scrollText ? -182 : 300)
            .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
            .onAppear() {
                scrollText.toggle()
            }
        }
        .frame(height: 25)
//        .frame(maxWidth: .infinity)
    }
}


struct TickerScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TickerScrollView()
    }
}
