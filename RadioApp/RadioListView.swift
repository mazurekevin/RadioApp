//
//  RadioListView.swift
//  RadioApp
//
//  Created by teamdoc on 27/08/2024.
//

import Foundation
import SwiftUI

struct RadioListView: View {
    
    var body: some View {
        VStack {
            HeaderView(title: "Radios").padding(.bottom, 20)
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Radio!")
            Spacer()
        }
        .padding()
    }
}
