//
//  SigInModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 06.10.2022.
//

import Foundation

struct SigInModel: Codable {
    let message: String?
    let user: UserModel?
    let auth_token: String?
    
    let error:String?
    
}
