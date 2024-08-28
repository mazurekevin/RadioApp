//
//  LibraryView.swift
//  RadioApp
//
//  Created by teamdoc on 27/08/2024.
//

import Foundation
import SwiftUI

struct LibraryView: View {
        
    var body: some View {
        VStack {
            
            HeaderView(title: "Bibliothèque").padding(.bottom, 20)
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Library!")
            Spacer()
        }
        .padding()
    }
}
