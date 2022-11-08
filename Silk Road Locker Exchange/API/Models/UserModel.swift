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
    let first_name: String
    let last_name: String
    let email: String
    let phone: String?
    let name: String?
    let profile_picture_url: String?
    
    func getName() -> String {
        return "\(first_name) \(last_name)"
    }
}

struct GetUserModel: Codable {
    let user: UserModel?
}

struct UserProfileModel: Codable {
    let success: Bool
    let data: GetUserModel?
    let error: String?

}

struct ChangePasswordModel: Codable {
    let password: String
    let password_confirmation: String
    let current_password: String
}

struct UpdateProfileModel: Codable {
    let first_name: String?
    let last_name: String?
    let phone: String?
}
