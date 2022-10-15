//
//  MenuPresenter.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import Foundation

protocol MenuViewPresenterProtocol: AnyObject {
    init(view: MenuViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol)
    var model: MenuModel? { get }
    var meals: [Meal]? { get }
    var currentCity: String? { get }
    var currentCategoryIndex: Int { get }
    func getData()
    func mealDidSelected(model: Meal?)
    func tapOnTheCityButton()
    func topSaleDidSelected(model: MenuModel.TopSale?)
    func categoryDidSelected(index: Int)
}

class MainPresenter: MenuViewPresenterProtocol {
    
    let networkManager: NetworkManagerProtocol!
    weak var view: MenuViewProtocol?
    internal var model: MenuModel?
    var router: RouterProtocol?
    var currentCity: String? = "Москва"
    var currentCategoryIndex: Int = 0
    
    var meals: [Meal]? {
        switch currentCategoryIndex {
        case 0:
            return model?.meals.filter { $0.category == "Пицца" }
        case 1:
            return model?.meals.filter { $0.category == "Комбо" }
        case 2:
            return model?.meals.filter { $0.category == "Десерт" }
        case 3:
            return model?.meals.filter { $0.category == "Напиток" }
        default:
            return nil
        }
    }
    
    required init(view: MenuViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
    }
    
    func categoryDidSelected(index: Int) {
        currentCategoryIndex = index
        view?.reloadData()
        print("DEBUG: Category \(Constants.categories[index]) did selected")
    }
    
    func topSaleDidSelected(model: MenuModel.TopSale?) {
        if let model = model {
            print("DEBUG: Sale with index \(model.id) did selected")
        }
    }
    
    func mealDidSelected(model: Meal?) {
        if let model = model {
            print("DEBUG: Meal - '\(model.name)' did selected")
        }
    }
    
    func tapOnTheCityButton() {
        // router.showCities()
        print("DEBUG: City button did tapped")
    }
    
    func tapOnTheSale(index: Int) {
        //
    }
    
    func getData() {
        guard let url = Constants.mainAPI else { return }
        networkManager?.getData(type: MenuModel.self, from: url, completion: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.model = model
                    self?.view?.reloadData()
                case .failure(let error):
                    self?.view?.showFailure(error: error)
                }
            }
        })
    }
}

