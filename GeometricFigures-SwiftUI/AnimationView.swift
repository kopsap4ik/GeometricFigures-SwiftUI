//
//  AnimationView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 03.11.2020.
//

import SwiftUI

struct AnimationView: View {
    @State private var showShape = true
    
    var body: some View {
        VStack {
            Button(action: { showShape.toggle() }) {
                HStack{
                    Image(systemName: showShape ?
                            "arrow.uturn.down" :
                            "arrow.uturn.up")
                    Text(showShape ? "Убрать фигуру" : "Показать фигуру")
                        .frame(minWidth: 250)
                }
            }
            .font(.title)
            
            Spacer()
            
            GradientRectanglesView(width: 250, height: 250)
                .offset(y: showShape ? 0 : UIScreen.main.bounds.height)
                .animation(Animation.interpolatingSpring(mass: 2,
                                                stiffness: 80,
                                                damping: 10,
                                                initialVelocity: 1)
                            .speed(2.0)
                            .delay(0.1)
                )
                
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}