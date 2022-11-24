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
    
    var loadLocationsDelegat: LoadLocationsProtocol?
    
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
                    if let orders = purchasedOrder.data?.orders {
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
                    if let orders = purchasedOrder.data?.offers {
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
    
    //SelectLocationViewController
    func SelectLocation() {
        
        let vc = SelectLocationViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func SelectLocker(digital_lockers: [DigitalLockersModel]) {
        
        let vc = SelectLockerViewController.instantiate()
        vc.coordinator = self
        vc.digital_lockers = digital_lockers
        navigationController.pushViewController(vc, animated: true)
    }
    
    func PurchasOfer(locker_id: Int) {
        self.errorDelegat?.startActyvity()
        API_Request.shared.PurchasOfer(offer_id: selectOfferID ?? 0, locker_id: locker_id).sink { error in
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
                    self.navigationController.popToRootViewController(animated: true)
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func RejectOfer() {
        self.errorDelegat?.startActyvity()
        API_Request.shared.RejectBuyOffer(offer_id: selectOfferID ?? 0).sink { error in
                // no-op
            print("Error=====================\(error)")
        
        } receiveValue: { (purchasedOrder: RejectOffersOrderModel) in
            self.errorDelegat?.stopActyvity()
            if let error = purchasedOrder.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                DispatchQueue.main.async {
                    self.navigationController.popToRootViewController(animated: true)
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func  getAdrresses(zip_code: String) {
        self.errorDelegat?.startActyvity()
        API_Request.shared.Location(zip_code: zip_code).sink { error in
                // no-op
            print("Error=====================\(error)")
            self.errorDelegat?.stopActyvity()
        } receiveValue: { (receivedBuyer: BaseLocationResponseModel) in
            self.errorDelegat?.stopActyvity()
            if let error = receivedBuyer.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                DispatchQueue.main.async {
                    if let location = receivedBuyer.data?.location {
                        self.loadLocationsDelegat?.update(location)
                    }
                }
            }
        }.store(in: &anyCancellables)
    }
}
