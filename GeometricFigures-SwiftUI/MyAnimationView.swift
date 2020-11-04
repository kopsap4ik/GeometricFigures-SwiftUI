//
//  MyAnimationView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 04.11.2020.
//

import SwiftUI

struct MyAnimationView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    @State private var opacity = 1.0
    
    var body: some View {
        HStack{
            Circle()
                .opacity(opacity)
                .animation(Animation
                            .linear(duration: 0.6)
                            .delay(0.0)
                            .repeatForever(autoreverses: true))

            Circle()
                .opacity(opacity)
                .animation(Animation
                            .linear(duration: 0.4)
                            .delay(0.2)
                            .repeatForever(autoreverses: true))
            
            Circle()
                .opacity(opacity)
                .animation(Animation
                            .linear(duration: 0.2)
                            .delay(0.4)
                            .repeatForever(autoreverses: true))
        }
        .foregroundColor(.blue)
        .frame(width: width, height: height)
        .onAppear{ opacity = 0.0 }
    }
}

struct MyAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MyAnimationView(width: 200, height: 200)
    }
}
