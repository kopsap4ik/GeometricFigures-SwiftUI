//
//  TabShapesView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 03.11.2020.
//

import SwiftUI

struct TabShapesView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LoadingView(width: 250, height: 250)
                    GradientRectanglesView(width: 250, height: 250)
                    PathView(width: 250, height: 250)
                    CurvesView(width: 250, height: 250)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarTitle("Все значки")
        }
    }
}

struct TabShapesView_Previews: PreviewProvider {
    static var previews: some View {
        TabShapesView()
    }
}
