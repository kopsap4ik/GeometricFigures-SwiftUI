//
//  LoadingView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 04.11.2020.
//

import SwiftUI

struct LoadingView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    @State private var opacity = 1.0
    
    var body: some View {
        HStack{
            Circle()
                .animation(nil)
                /* чтобы не было анимации при других изменениях (например: прыгают круги в представлении GridView.swift из-за разного расположения при инициализации) */
                .opacity(opacity)
                .animation(Animation
                            .linear(duration: 0.6)
                            .delay(0.0)
                            .repeatForever(autoreverses: true))
            
            Circle()
                .animation(nil)
                .opacity(opacity)
                .animation(Animation
                            .linear(duration: 0.4)
                            .delay(0.2)
                            .repeatForever(autoreverses: true))
            
            Circle()
                .animation(nil)
                .opacity(opacity)
                .animation(Animation
                            .linear(duration: 0.2)
                            .delay(0.4)
                            .repeatForever(autoreverses: true))
        }
        .foregroundColor(.blue)
        .frame(width: width, height: height)
//        .onTapGesture{ opacity = 0.0 }
        .onAppear{ opacity = 0.0 }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(width: 200, height: 200)
    }
}
