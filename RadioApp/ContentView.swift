//
//  ContentView.swift
//  RadioApp
//
//  Created by teamdoc on 22/08/2024.
//

import SwiftUI
import SwiftyJSON

struct ContentView: View {
    
    let json: JSON? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
