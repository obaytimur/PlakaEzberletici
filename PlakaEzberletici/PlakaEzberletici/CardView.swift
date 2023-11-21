//
//  CardView.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 21/11/2023.
//

import SwiftUI

struct CardView: View {
    let proxy: GeometryProxy
    var body: some View {
        Rectangle(
            GeometryReader { proxy in
                      // 2
                      ZStack {
                         // 3
                         Image("me")
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              .clipped()
                          // 4
                          VStack(alignment: .leading) {
                              // 5
                              Text("Gary")
                                  .foregroundColor(.white)
                                  .fontWeight(.bold)
                              Text("iOS Dev")
                                  .foregroundColor(.white)
                                  .fontWeight(.bold)
                          }
                          // 6
                          .position(
                              x: proxy.frame(in: .local).minX + 75,
                              y: proxy.frame(in: .local).maxY - 50
                          )
                      }
                  }
        )
            .cornerRadius(10)
            .frame(
                maxWidth: proxy.size.width - 100,
                maxHeight: proxy.size.height * 0.4
            )
            .position(
                x: proxy.frame(in: .global).midX,
                y: proxy.frame(in: .local).midY - 30
            )
        
    }
}

struct CardView_Previews: PreviewProvider{
    static var previews: some View{
        GeometryReader {proxy in
        CardView(proxy: proxy)}
    }
}
