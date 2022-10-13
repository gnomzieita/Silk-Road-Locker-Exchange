//
//  Coordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 04.10.2022.
//

import Foundation
import UIKit

protocol ErrorProtocol {
    func error(_ error:String)
}

protocol Coordinator:AnyObject {
    
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
