//
//  SystemHGridView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 06.11.2020.
//

import SwiftUI

struct SystemHGridView: View {
    let data = (1...100).map{ "Item: \($0)" }
    let rows = [
        
        //несколько строк, рассчитываются автоматом исходя из размеров (минимум и/или максимум)
//        GridItem(.adaptive(minimum: 100, maximum: 300))
        
        // одна строка, но можно использовать несколько с заданной шириной
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100))
        
        // один столбец, но можно использовать несколько с заданными размерами или без (автоматически  посчитает)
        GridItem(.flexible(maximum: .infinity)),
        GridItem(.flexible(minimum: 200)),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: rows, alignment: .top, spacing: 10){
                ForEach(data, id: \.self){ item in
                    Text(item)
                    
                }
            }
        }
    }
}

struct SystemHGridView_Previews: PreviewProvider {
    static var previews: some View {
        SystemHGridView()
    }
}
