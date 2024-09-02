//
//  SplashScreenView.swift
//  RadioApp
//
//  Created by teamdoc on 27/08/2024.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            NavBar()
        } else {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                Image("AppIconRadio")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.blue)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }

}

#Preview {
    SplashScreenView()
}
