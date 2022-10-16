//
//  MealEntity+CoreDataProperties.swift
//  
//
//  Created by Дмитрий Садырев on 16.10.2022.
//
//

import Foundation
import CoreData


extension MealEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealEntity> {
        return NSFetchRequest<MealEntity>(entityName: "MealEntity")
    }

    @NSManaged public var id: Int16
    @NSManaged public var category: String?
    @NSManaged public var name: String?
    @NSManaged public var descript: String?
    @NSManaged public var price: Int16
    @NSManaged public var imageURL: String?

}
