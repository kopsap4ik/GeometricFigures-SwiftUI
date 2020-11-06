//
//  TabCustomGridView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 05.11.2020.
//

import SwiftUI

struct TabCustomGridView: View {
    let awards = Award.getAwards() // все значки
    var myAwards: [Award] {
        awards.filter{ $0.isAwarded }
    }
    
    var body: some View {
        NavigationView{
            CustomAnyGridView(items: myAwards, columns: 2) { award, itemSize in
                VStack(spacing: 0){
                    award.awardView
                    Text("\(award.title)")
                }
                .frame(width: itemSize, height: itemSize)
            }
            .navigationBarTitle("Мои значки: \(myAwards.count)")
        }
    }
}

struct TabCustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        TabCustomGridView()
    }
}
