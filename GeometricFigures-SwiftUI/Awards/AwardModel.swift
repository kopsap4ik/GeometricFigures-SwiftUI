//
//  Award.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 05.11.2020.
//

import SwiftUI

struct Award {
    let awardView: AnyView
    let title: String
    let isAwarded: Bool
    
    static func getAwards() -> [Award] {
        [
            Award(awardView: AnyView(GradientRectanglesView(width: 200, height: 200)),
                  title: "First view",
                  isAwarded: true),
            Award(awardView: AnyView(PathView(width: 200, height: 200)),
                  title: "Second view",
                  isAwarded: true),
            Award(awardView: AnyView(CurvesView(width: 200, height: 200)),
                  title: "Third view",
                  isAwarded:  true),
            Award(awardView: AnyView(LoadingView(width: 200, height: 200)),
                  title: "My view",
                  isAwarded: true)
        ]
    }
}
