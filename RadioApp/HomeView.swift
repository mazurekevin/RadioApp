//
//  HomeView.swift
//  RadioApp
//
//  Created by teamdoc on 27/08/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        VStack {
            
            HeaderView(title: "Accueil").padding(.bottom, 20)
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Home!")
            Spacer()
        }
        .padding()
    }
}
