//
//  ContentView.swift
//  Xchange
//
//  Created by Sania Sinha on 1/20/24.
//

import UIKit
import SwiftUI

struct ContentView: View {
    @State private var isSharePresented: Bool = false
    let paymentHandler = PaymentHandler()
    
    var body: some View {
        GeometryReader{
            proxy in
            ScrollView(.vertical){
                Color.black
                ZStack (alignment: .top) {
                    Color.black
                    VStack {
                        Text("CardeB")
                            .font(.custom(
                                    "AmericanTypewriter",
                                    fixedSize: 34)
                                    .weight(.bold))
                            .foregroundColor(.pink)
                        CardList()
                    }
                    .padding()
                    Spacer()
                    .frame(minHeight: proxy.size.height)
                }
            }
        }
        Button("Share app") {
                    self.isSharePresented = true
                }
        .sheet(isPresented: $isSharePresented, onDismiss: {
            print("Dismiss")
        }, content: {
            ActivityViewController(activityItems: [URL(string: "https://sanya1001.github.io/")!])
//            ActivityViewController(activityItems: [ShareLink(item: cards[0])])
        })
        
        Button(action: {
                    self.paymentHandler.startPayment { (success) in
                        if success {
                            print("Success")
                        } else {
                            print("Failed")
                        }
                    }
                }, label: {
                    Text("PAY WITH  APPLE")
                    .font(Font.custom("HelveticaNeue-Bold", size: 16))
                    .padding(10)
                    .foregroundColor(.white)
            }
        )
    
    }
    
}

#Preview {
    ContentView()
}
