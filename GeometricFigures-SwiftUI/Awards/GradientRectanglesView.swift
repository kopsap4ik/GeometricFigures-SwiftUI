//
//  GradientRectanglesView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 03.11.2020.
//

import SwiftUI

struct GradientRectanglesView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in // нужен, чтобы не оберзались края при добавлении в другую вью
            ZStack {
                ForEach (0..<3) { iteration in
                    Rectangle()
                        .fill(LinearGradient(
                                gradient: Gradient(colors: [.orange, .red]),
                                startPoint: UnitPoint(x: 0, y: 0),
                                endPoint: UnitPoint(x: 1, y: 1)))
                        .rotationEffect(.degrees(Double(iteration) * 60))
                        // уменьшаем картинки, чтобы они вошли во фрейм и не обрезались
                        .frame(width: geometry.size.width * 0.7,
                               height: geometry.size.height * 0.7)
                }
                Image(systemName: "airplane")
                    .resizable()
                    .foregroundColor(.yellow)
                    .opacity(0.5)
                    .rotationEffect(.degrees(-90))
                    .scaleEffect(0.7)
            }
        }
        .frame(width: width, height: height)
    }
}

struct GradientRectangles_Previews: PreviewProvider {
    static var previews: some View {
        GradientRectanglesView(width: 200, height: 200)
    }
}
