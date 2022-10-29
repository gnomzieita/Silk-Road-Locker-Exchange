//
//  API.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 06.10.2022.
//

import Foundation

struct API {
    
    /// If `true` we will get dev environment, if `false` - prod.
    /// Automatically switches between `dev` when building on simulator/device
    /// and `prod` when running TF (and AppStore in future) version
    static var inDebug: Bool {
    #if DEBUG
        return true
    #else
        return false
    #endif
    }
    
    struct Server{
        let baseURL: String
        let port: Int?
        
        func getURL() -> URL?{
            if let port = port {
                return URL(string: "\(baseURL):\(port)")
            } else {
                return URL(string: baseURL)
            }
        }
        
        func getURLwithPath(path: String) -> URL{
            if let port = port {
                return URL(string: "\(baseURL):\(port)\(path)")!
            } else {
                return URL(string: baseURL+path)!
            }
        }
    }
    
    static let server = Server(baseURL: inDebug ? "https://lit-refuge-48000.herokuapp.com/api/v1" : "https://lit-refuge-48000.herokuapp.com/api/v1", port: nil)
}


