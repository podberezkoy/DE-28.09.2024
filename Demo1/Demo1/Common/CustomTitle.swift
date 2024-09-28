//
//  CustomAlert.swift
//  Demo1
//
//  Created by user on 28.09.2024.
//

//     Пустой файл
//     28.09.2024
//     Юров Артем
//     Пустой файл

import Foundation
import SwiftUI
struct CustomTitle: View {
    //     Кастомные текстовые поля
    //     28.09.2024
    //     Юров Артем
    //     Текстовые поля обычные и секретные с возможностью скрытия/показа данных
    let title: String
    let description: String
    var body: some View {
            VStack{
                Text(title)
                    .fontWeight(.bold)
                    .font(.custom("Roboto",size: 24))
                    .padding(.top,20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(description)
                    .foregroundColor(.gray)
                    .padding(.bottom, 15)
                    .font(.custom("Roboto",size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
