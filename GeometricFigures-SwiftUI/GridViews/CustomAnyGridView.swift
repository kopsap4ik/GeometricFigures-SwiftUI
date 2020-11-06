//
//  CustomAnyGridView.swift
//  GeometricFigures-SwiftUI
//
//  Created by Василий Петухов on 05.11.2020.
//

import SwiftUI

// MARK:  - можно применять для любых типов данных

struct CustomAnyGridView<Content, T>: View where Content: View {
    let items: [T]
    let columns: Int
    let content: (T, CGFloat) -> Content //замыкание, которое вернется (объект + размер)
    var rows: Int { items.count / columns }
    
    var body: some View {
        GeometryReader { geometry in
            // размер ячейки (высота или ширина)
            let sideSize = geometry.size.width / CGFloat(columns)
            
            ScrollView{
                VStack{
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack(spacing: 0){
                            ForEach(0..<columns) { columnIndex in
                                if let index = elementRow(row: rowIndex, column: columnIndex){
                                    content(items[index], sideSize) // заполнение замыкания
                                } else {
                                    Spacer() // чтобы заполнить пустые ячейки
                                }
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

struct CustomAnyGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnyGridView(items: [11, 22, 121, 112, 12, 12, 3, 123, 12, 312, 3, 12, 31],
                        columns: 4) { item, size in
            Text("\(item)")
                .frame(width: size, height: size)
        }
    }
}
