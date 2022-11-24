//
//  SellCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 11.10.2022.
//

import Foundation
import UIKit
import Combine

protocol LoadBuyersProtocol {
    func update(_ data:[BuyerModel])
    
}

protocol LoadLocationsProtocol {
    func update(_ data:[LocationInfoModel])
    
}

protocol LoadOffersProtocol {
    func update(_ data:[OfferDetails])
    
}

class SellCoordinator: BaseCoordenator {
    
    var selectOfferID: Int?
    
    var loadDataDelegat: LoadDataProtocol?
    var loadBuyerDelegat: LoadBuyersProtocol?
//    var loadLocationsDelegat: LoadLocationsProtocol?
    var LoadOffersDelegat: LoadOffersProtocol?
    
    var selectedBuyer:BuyerModel?
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "Sell", image: UIImage.init(named: "Sell"), tag: 0)
    }
    
    override func start() {
        let vc = SellViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
    }
    
    func NewOffer() {
        let vc = CreateOfferViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func getByer() {
        //UserListViewController
        let vc = UserListViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func cancelOffer() {
        //UserListViewController
        let vc = UserListViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func selectBuyer(buyer:BuyerModel) {
        self.selectedBuyer = buyer
        navigationController.popViewController(animated: true)
    }
    
    func loadSellOrders() {
        self.errorDelegat?.startActyvity()
        API_Request.shared.SentOffers().sink { error in
                // no-op
            print("Error=====================\(error)")
            self.errorDelegat?.stopActyvity()
        } receiveValue: { (purchasedOrder: OffersOrderModel) in
            self.errorDelegat?.stopActyvity()
            if let error = purchasedOrder.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                DispatchQueue.main.async {
                    if let orders = purchasedOrder.data?.offers {
                        self.LoadOffersDelegat?.update(orders)
                    }
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func loadSoldOrders() {
        self.errorDelegat?.startActyvity()
        API_Request.shared.SoldOrders().sink { error in
                // no-op
            print("Error=====================\(error)")
            self.errorDelegat?.stopActyvity()
        } receiveValue: { (purchasedOrder: ReceivedOfersModel) in
            self.errorDelegat?.stopActyvity()
            if let error = purchasedOrder.error {
                self.errorDelegat?.error(error)
                
            }
            else
            {
                DispatchQueue.main.async {
                    if let orders = purchasedOrder.data?.orders{
                        //[OfferDetails]
                        self.LoadOffersDelegat?.update(orders)
                    }
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func  getBuyers() {
        self.errorDelegat?.startActyvity()
        API_Request.shared.ReceivedBuyer().sink { error in
                // no-op
            print("Error=====================\(error)")
            self.errorDelegat?.stopActyvity()
        } receiveValue: { (receivedBuyer: ReceivedBuyerModel) in
            self.errorDelegat?.stopActyvity()
            if let error = receivedBuyer.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                DispatchQueue.main.async {
                    if let buyers = receivedBuyer.data?.buyer {
                        self.loadBuyerDelegat?.update(buyers)
                    }
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func  CreateOffer(offer_model: CreateOfferModel) {
        self.errorDelegat?.startActyvity()
        API_Request.shared.CreateOffer(offer_model: offer_model).sink { error in
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
                self.selectOfferID = nil
                DispatchQueue.main.async {
                    self.navigationController.popViewController(animated: true)
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func  CreateOrder(offer_model: CreateOfferModel) {
        self.errorDelegat?.startActyvity()
        API_Request.shared.CreateOffer(offer_model: offer_model).sink { error in
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
                    self.navigationController.popViewController(animated: true)
//                    if let location = receivedBuyer.data?.location, !location.isEmpty {
//                        self.loadLocationsDelegat?.update(location)
//                    }
                }
            }
        }.store(in: &anyCancellables)
    }
    
    //CancelSellOffer
    func RejectOfer() {
        self.errorDelegat?.startActyvity()
        API_Request.shared.CancelSellOffer(offer_id: selectOfferID ?? 0).sink { error in
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
    
    func PurchaseOfferDeteil(offerDetails:OfferDetails) {
        
        self.selectOfferID = offerDetails.id
        
        let vc = OfferDetailsViewController.instantiate()
        vc.coordinator = self
        vc.offerInfo = offerDetails
        navigationController.pushViewController(vc, animated: true)
    }
}
