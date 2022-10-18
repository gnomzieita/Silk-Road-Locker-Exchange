//
//  SignUpModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 13.10.2022.
//

import Foundation

struct SignUpModel: Codable {
    let first_name: String
    let last_name: String
    let email: String
    //let phone: String?
    let password: String
    //let password_confirmation: String?
}
