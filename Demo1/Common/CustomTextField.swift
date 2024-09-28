//
//  CustomTextField.swift
//  Demo1
//
//  Created by user on 28.09.2024.
//

import Foundation
import SwiftUI
struct CustomTextField: View {
    //     Кастомные текстовые поля
    //     28.09.2024
    //     Юров Артем
    //     Текстовые поля обычные и секретные с возможностью скрытия/показа данных
    let isSecureField: Bool
    let titleField: String
    let placeholderField: String
    
    @State var isSecure: Bool = false
    @Binding var text: String
    var body: some View {
        if isSecureField {
            VStack{
                Text(titleField)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Roboto",size: 14))
                    .foregroundColor(.gray)
                ZStack(alignment: .trailing){
                    if !isSecure {
                        SecureField(placeholderField, text: $text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .padding(.trailing, 30)
                            .cornerRadius(4)
                            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray))
                    }
                    else {
                        TextField(placeholderField, text: $text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .padding(.trailing, 30)
                            .cornerRadius(4)
                            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray))
                    }
                    Button( action: {
                        isSecure.toggle()
                    })
                    { 
                        HStack {
                            Image(systemName: isSecure ? "eye" : "eye.slash")
                                .frame(maxWidth: 1, alignment: .leading)
                                .accentColor(.gray)
                                .padding(10)
                                .font(.system(size: 12))
                                .scaleEffect(x:-1,y:1)
                            
                        }
                    }
                }
            }
        }
        else {
            VStack {
                Text(titleField)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.custom("Roboto",size: 14))
                    .foregroundColor(.gray)
                TextField(placeholderField, text: $text)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(4)
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray))
            }
        }
    }
}
