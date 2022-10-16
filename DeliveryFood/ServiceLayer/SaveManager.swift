//
//  SaveManager.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 16.10.2022.
//

import UIKit
import CoreData

protocol SaveManagerProtocol {
    func saveMenu(model: MenuModel?)
    func getSavedMenu() -> MenuModel?
}

class SaveManager: SaveManagerProtocol {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveMenu(model: MenuModel?) {
        
        guard let model = model,
              let menu = fetchMenu()
        else { return }
        
        for mealModel in model.meals {
            if let meal = fetchMeal(id: mealModel.id, from: menu) {
                meal.id = Int16(mealModel.id)
                meal.category = mealModel.category
                meal.name = mealModel.name
                meal.descript = mealModel.description
                meal.price = Int16(mealModel.price)
                meal.imageURL = mealModel.imageURL
            }
        }
        
        for modelTopSale in model.topSales {
            if let topSale = fetchTopSale(id: modelTopSale.id, from: menu) {
                topSale.id = Int16(modelTopSale.id)
                topSale.imageURL = modelTopSale.imageURL
            }
        }
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func fetchMenu() -> MenuEntity? {
        let fetchRequest = MenuEntity.fetchRequest()
        do {
            let fetchResult = try context.fetch(fetchRequest)
            if let menu = fetchResult.first {
                return menu
            } else {
                return MenuEntity(context: context)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func fetchMeal(id: Int, from menu: MenuEntity) -> MealEntity? {
        let fetchRequest = MealEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %i", id)
        do {
            let fetchResult = try context.fetch(fetchRequest)
            if let meal = fetchResult.first {
                return meal
            } else {
                let newMeal = MealEntity(context: context)
                menu.addToMeals(newMeal)
                return newMeal
            }
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func fetchTopSale(id: Int, from menu: MenuEntity) -> TopSaleEntity? {
        let fetchRequest = TopSaleEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %i", id)
        do {
            let fetchResult = try context.fetch(fetchRequest)
            if let topSale = fetchResult.first {
                return topSale
            } else {
                let newTopSale = TopSaleEntity(context: context)
                menu.addToTopSales(newTopSale)
                return newTopSale
            }
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getSavedMenu() -> MenuModel? {
        let topSaleFetchRequest = TopSaleEntity.fetchRequest()
        let mealsFetchRequest = MealEntity.fetchRequest()
        do {
            let topSales = try context.fetch(topSaleFetchRequest).compactMap({
                MenuModel.TopSale(id: Int($0.id), imageURL: $0.imageURL)
            })
            let meals = try context.fetch(mealsFetchRequest).compactMap({
                Meal(id: Int($0.id), category: $0.category, name: $0.name, description: $0.descript, price: Int($0.price), imageURL: $0.imageURL)
            })
            return MenuModel(topSales: topSales, meals: meals)
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
}



