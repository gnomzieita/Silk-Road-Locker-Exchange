//
//  PurchasedCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 10.10.2022.
//

import Foundation
import UIKit
import Combine

protocol LoadDataProtocol {
    func update(_ data:[OrderModel])
    
}

class PurchasedCoordinator: BaseCoordenator {
    
    var selectOfferID: Int?
    
    var loadDataDelegat: LoadDataProtocol?
    var loadOffersDelegat: LoadOffersProtocol?
    
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "Purchased", image: UIImage.init(named: "Purchased"), tag: 0)
    }
    
    override func start() {
        let vc = PurchasedViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
    }
    
    func loadPurchasedOrders() {
        self.errorDelegat?.startActyvity()
        API_Request.shared.PurchasedOrders().sink { error in
                // no-op
            print("Error=====================\(error)")
        
        } receiveValue: { (purchasedOrder: PurchasedOrderModel) in
            self.errorDelegat?.stopActyvity()
            if let error = purchasedOrder.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                DispatchQueue.main.async {
                    if let orders = purchasedOrder.data?.orders, orders.count > 0 {
                        self.loadDataDelegat?.update(orders)
                    }
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func loadReceivedOrders() {
        self.errorDelegat?.startActyvity()
        API_Request.shared.ReceivedOffers().sink { error in
                // no-op
            print("Error=====================\(error)")
        
        } receiveValue: { (purchasedOrder: OffersOrderModel) in
            self.errorDelegat?.stopActyvity()
            if let error = purchasedOrder.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                DispatchQueue.main.async {
                    if let orders = purchasedOrder.data?.offers, orders.count > 0 {
                        self.loadOffersDelegat?.update(orders)
                    }
                }
            }
        }.store(in: &anyCancellables)
    }
    
    //PurchaseViewController
    func PurchaseOfferDeteil(offerDetails:OfferDetails) {
        
        self.selectOfferID = offerDetails.id
        
        let vc = PurchaseViewController.instantiate()
        vc.coordinator = self
        vc.offerInfo = offerDetails
        navigationController.pushViewController(vc, animated: true)
    }
    
//    func loadReceivedOrders() {
//        self.errorDelegat?.startActyvity()
//        API_Request.shared.ReceivedOffers().sink { error in
//                // no-op
//            print("Error=====================\(error)")
//        
//        } receiveValue: { (purchasedOrder: OffersOrderModel) in
//            self.errorDelegat?.stopActyvity()
//            if let error = purchasedOrder.error {
//                self.errorDelegat?.error(error)
//            }
//            else
//            {
//                DispatchQueue.main.async {
//                    if let orders = purchasedOrder.data?.offers, orders.count > 0 {
//                        self.loadOffersDelegat?.update(orders)
//                    }
//                }
//            }
//        }.store(in: &anyCancellables)
//    }
}
