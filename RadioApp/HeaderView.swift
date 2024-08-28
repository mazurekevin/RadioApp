//
//  HeaderView.swift
//  RadioApp
//
//  Created by teamdoc on 28/08/2024.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    
    let title: String
        
    init(title: String) {
        self.title = title
        
    }
    
    var body: some View {
        HStack{
            Text(self.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
                Button(action: {
                    print("Page profile")
                }) {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                }
        }.padding()
    }
}
