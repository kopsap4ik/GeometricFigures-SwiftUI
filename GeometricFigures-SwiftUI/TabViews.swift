//
//  TabViews.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 04.11.2020.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            ShapesView()
                .tabItem {
                    Image(systemName: "skew")
                    Text("Фигуры")
                }
            AnimationView()
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                    Text("Анимации")
                }
        }
    }
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
