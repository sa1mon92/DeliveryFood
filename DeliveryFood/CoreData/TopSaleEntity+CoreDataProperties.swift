//
//  TopSaleEntity+CoreDataProperties.swift
//  
//
//  Created by Дмитрий Садырев on 16.10.2022.
//
//

import Foundation
import CoreData


extension TopSaleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopSaleEntity> {
        return NSFetchRequest<TopSaleEntity>(entityName: "TopSaleEntity")
    }

    @NSManaged public var id: Int16
    @NSManaged public var imageURL: String?

}
