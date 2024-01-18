//
//  UserInfo.swift
//  DigiForm
//
//  Created by Daniel ST on 17/01/24.
//

import Foundation

struct UserInfo {
    let name: String
    let lastname: String
    let secondLastname: String
    let email: String
    let phoneNumber: String
    
    init(name: String, lastname: String, secondLastname: String, email: String, phoneNumber: String) {
        self.name = name
        self.lastname = lastname
        self.secondLastname = secondLastname
        self.email = email
        self.phoneNumber = phoneNumber
    }
}
