//
//  CustomTextGridView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 05.11.2020.
//

import SwiftUI

// MARK:  - годится только для текста, для других данных нужно описать еще структуры

struct CustomTextGridView: View {
    
    let items: [Int]
    let columns: Int
    
    var rows: Int { items.count / columns }
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0...rows, id: \.self) { rowIndex in
                    HStack{
                        ForEach(0..<columns) { columnIndex in
                            if let index = elementRow(row: rowIndex, column: columnIndex){
                                Text("\(items[index])")
                            } else {
                                Text("") // пустой текст, чтобы заполнить недостающие ячейки
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    /* проверка на вхождение в диапазон массива,
        когда не хватает данных для полного заполнения строки */
    private func elementRow(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
    
}

struct CustomTextGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextGridView(items: [11, 22, 121, 112, 12, 12, 3, 123, 12, 312, 3, 12, 31],
                     columns: 4)
    }
}
