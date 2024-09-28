//
//  Repositories.swift
//  Demo1
//
//  Created by user on 28.09.2024.
//

import Foundation
import Supabase
import SwiftUI

class Repositories {
    // паттерн instance
    static let instance = Repositories()
    
    // подключение supabase
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://zriynhvaphpyvidlgwwn.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpyaXluaHZhcGhweXZpZGxnd3duIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjcyMzI3NTgsImV4cCI6MjA0MjgwODc1OH0.CvEkHoYPSEksR1_812T00SOLiR1d5ZNKVWq4qiAWdIM",
        options: .init())
    
    
    // регистрация в supabase
    func signUp(name: String, phone: String, email: String, password: String) async throws {
        try await supabase.auth.signUp(email: email, password: password)
        
        let user = try await supabase.auth.session.user
        
        let newUser = UserModel(id: user.id, name: name, phone: phone, created_at: .now)
        
        try await supabase.from("users")
            .insert(newUser)
            .execute()
        
        try await supabase.auth.signOut()
    }
    func signIn(email: String, password: String) async throws {
           try await supabase.auth.signIn(email: email, password: password)
       }

    
}
