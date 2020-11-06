//
//  TabsView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 04.11.2020.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            TabShapesView()
                .tabItem {
                    Image(systemName: "list.bullet.below.rectangle")
                    Text("VStack")
                }
            TabCustomGridView()
                .tabItem {
                    Image(systemName: "rectangle.grid.3x2")
                    Text("Custom Grid")
                }
            TabSystemGridView()
                .tabItem {
                    Image(systemName: "table")
                    Text("System Grid")
                }
            TabAnimationView()
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                    Text("Анимации")
                }
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
