//
//  PathView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 03.11.2020.
//

import SwiftUI

struct PathView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let middle = size / 2
            let nearLine = size * 0.1
            let farLine = size * 0.9
            
            // исходная фигура, но не удобно харкорить размеры!
            //            Path{ path in
            //                path.move(to: CGPoint(x: 120, y: 20))
            //                path.addLine(to: CGPoint(x: 180, y: 180))
            //                path.addLine(to: CGPoint(x: 20, y: 180))
            //                path.addLine(to: CGPoint(x: 80, y: 20))
            //            }
            
            // дорога
            Path{ path in
                path.move(to: CGPoint(x: middle + nearLine, y: nearLine))
                path.addLine(to: CGPoint(x: farLine, y: farLine))
                path.addLine(to: CGPoint(x: nearLine, y: farLine))
                path.addLine(to: CGPoint(x: middle - nearLine, y: nearLine))
            }
            .fill(Color(red: 0.4, green: 0.4, blue: 0.4))
            
            // разметка на дороге
            Path{ path in
                path.move(to: CGPoint(x: middle, y: nearLine))
                path.addLine(to: CGPoint(x: middle, y: farLine))
            }
            .stroke(Color(.white),
                    style: StrokeStyle(lineWidth: 3,
                                       dash: [geometry.size.height / 20]))
            // машинка на дороге
            Image(systemName: "car")
                .resizable()
                .foregroundColor(.yellow)
                .scaleEffect(0.2)
                .offset(x: -geometry.size.width / 7.5)
            
        }
        .frame(width: width, height: height)
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView(width: 200, height: 200)
    }
}
