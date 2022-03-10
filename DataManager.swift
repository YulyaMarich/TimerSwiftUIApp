//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Julia on 07.03.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    func saveUser(user: String) {
        UserDefaults.standard.set(user, forKey: "User")
    }
    
    func setUser() -> String {
        let user = UserDefaults.standard.string(forKey: "User") ?? ""
        return user
    }
    
    func deleteUser() {
        UserDefaults.standard.removeObject(forKey: "User")
    }
}
