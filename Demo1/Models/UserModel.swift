//
//  UserModel.swift
//  Demo1
//
//  Created by user on 25.09.2024.
//

import Foundation

struct UserModel: Codable {
    var id: UUID
    var name: String
    var phone: String
    var created_at: Date
}
//     Модель данных пользователя
//     28.09.2024
//     Юров Артем
//     Данные для Supabase
