//
//  RadioItemView.swift
//  RadioApp
//
//  Created by teamdoc on 12/09/2024.
//

import Foundation
import SwiftUI

struct RadioItemView: View {
    @Binding var radio: RadioStation

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: radio.icon)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 125, height: 125)
                        .cornerRadius(8)
                } else if phase.error != nil {
                    Color.gray
                        .frame(width: 125, height: 125)
                        .cornerRadius(8)
                } else {
                    ProgressView()
                        .frame(width: 125, height: 125)
                }
            }
            Text(radio.name)
                .font(.caption)
                .padding(.top, 5)
        }
        .padding()
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}

