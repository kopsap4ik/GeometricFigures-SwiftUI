//
//  CurvesView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 03.11.2020.
//

import SwiftUI

struct CurvesView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let middle = size / 2
            let topLine = size * 0.1
            let bottomLine = size * 0.9
            
            // фоновая фигура
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: middle, y: topLine))
                    path.addQuadCurve(to:  CGPoint(x: bottomLine, y: middle),
                                      control: CGPoint(x: size, y: 0))
                    path.addQuadCurve(to:  CGPoint(x: middle, y: bottomLine),
                                      control: CGPoint(x: size, y: size))
                    path.addQuadCurve(to:  CGPoint(x: topLine, y: middle),
                                      control: CGPoint(x: 0, y: size))
                    path.addQuadCurve(to:  CGPoint(x: middle, y: topLine),
                                      control: CGPoint(x: 0, y: 0))
                    
                }
                .fill(RadialGradient(
                        gradient: Gradient(colors: [.purple, .pink]),
                        center: .center,
                        startRadius: 0,
                        endRadius: size))
                
                // закругленные штрихи
                Path { path in
                    path.addArc(center: CGPoint(x: topLine, y: topLine),
                                radius: middle,
                                startAngle: .degrees(90),
                                endAngle: .degrees(0),
                                clockwise: true)
                    path.addArc(center: CGPoint(x: bottomLine, y: topLine),
                                radius: middle,
                                startAngle: .degrees(180),
                                endAngle: .degrees(90),
                                clockwise: true)
                    path.addArc(center: CGPoint(x: bottomLine, y: bottomLine),
                                radius: middle,
                                startAngle: .degrees(270),
                                endAngle: .degrees(180),
                                clockwise: true)
                    path.addArc(center: CGPoint(x: topLine, y: bottomLine),
                                radius: middle,
                                startAngle: .degrees(0),
                                endAngle: .degrees(270),
                                clockwise: true)
                }
                .stroke(Color.yellow, lineWidth: 2)
                
            }
        }
        .frame(width: width, height: height)
    }
}

struct CurvesView_Previews: PreviewProvider {
    static var previews: some View {
        CurvesView(width: 300, height: 300)
    }
}
