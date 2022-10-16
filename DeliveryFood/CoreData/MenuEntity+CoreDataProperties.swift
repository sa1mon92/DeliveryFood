//
//  MenuEntity+CoreDataProperties.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 16.10.2022.
//
//

import Foundation
import CoreData


extension MenuEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MenuEntity> {
        return NSFetchRequest<MenuEntity>(entityName: "MenuEntity")
    }

    @NSManaged public var meals: NSSet?
    @NSManaged public var topSales: NSSet?

}

// MARK: Generated accessors for meals
extension MenuEntity {

    @objc(addMealsObject:)
    @NSManaged public func addToMeals(_ value: MealEntity)

    @objc(removeMealsObject:)
    @NSManaged public func removeFromMeals(_ value: MealEntity)

    @objc(addMeals:)
    @NSManaged public func addToMeals(_ values: NSSet)

    @objc(removeMeals:)
    @NSManaged public func removeFromMeals(_ values: NSSet)

}

// MARK: Generated accessors for topSales
extension MenuEntity {

    @objc(addTopSalesObject:)
    @NSManaged public func addToTopSales(_ value: TopSaleEntity)

    @objc(removeTopSalesObject:)
    @NSManaged public func removeFromTopSales(_ value: TopSaleEntity)

    @objc(addTopSales:)
    @NSManaged public func addToTopSales(_ values: NSSet)

    @objc(removeTopSales:)
    @NSManaged public func removeFromTopSales(_ values: NSSet)

}

extension MenuEntity : Identifiable {

}
