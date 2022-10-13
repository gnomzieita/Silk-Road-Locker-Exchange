//
//  UserModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 06.10.2022.
// https://www.swiftpal.io/articles/understanding-codable-parsing-json-advance-part-two

//TODO:https://www.swiftpal.io/articles/understanding-codable-parsing-json-advance-part-two
import Foundation

struct UserModel: Codable {
    let id: Int
    let first_name: String?
    let last_name: String?
    let email: String
    let phone: String
    let name: String
}
