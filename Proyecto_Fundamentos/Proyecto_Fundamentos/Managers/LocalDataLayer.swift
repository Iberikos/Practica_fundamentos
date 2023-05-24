//
//  LocalDatalayer.swift
//  Proyecto_Fundamentos
//
//  Created by Rubén Pulido Marchal on 24/5/23.
//

import Foundation

final class LocalDataLayer {
    
    private static let token = "token"
    static let shared = LocalDataLayer()
    
    //Tokenh
    
    func save(token: String) {
        return UserDefaults.standard.set(token, forKey: Self.token)
    }
    
    func getToken() -> String {
        return UserDefaults.standard.string(forKey: Self.token) ?? ""
    }
    
    func isUserLogged() -> Bool {
        return !getToken().isEmpty
    }
    
    
    
}
