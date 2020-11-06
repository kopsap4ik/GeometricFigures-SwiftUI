//
//  TabSystemGridView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 06.11.2020.
//

import SwiftUI

struct TabSystemGridView: View {
    
    @State var showColumns = true
    
    let awards = Award.getAwards() // все значки
    var myAwards: [Award] {
        awards.filter{ $0.isAwarded }
    }
    let columns = [
        // все варианты описаны в VerticalSystemGridView.swift и HorizontalSystemGridView.swift
        GridItem(.adaptive(minimum: 200))
    ]
    
    let rows = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    var body: some View {
        NavigationView{
            
            Group{
                if showColumns {
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 10){
                            ForEach(myAwards, id: \.title){ award in
                                VStack{
                                award.awardView
                                Text("\(award.title)")
                                }
                            }
                        }
                    }
                } else {
                    ScrollView(.horizontal){
                        LazyHGrid(rows: rows, alignment: .top, spacing: 10){
                            ForEach(myAwards, id: \.title){ award in
                                VStack{
                                award.awardView
                                Text("\(award.title)")
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Значки в \(showColumns ? "колонках" : "рядах"): \(myAwards.count)")
            .navigationBarItems(trailing:
                Button(action: { showColumns.toggle() }) {
                    Text(showColumns ? "Показать ряды" : "Показать колонки")
                })
        }
    }
}

struct TabSystemGridView_Previews: PreviewProvider {
    static var previews: some View {
        TabSystemGridView()
    }
}
