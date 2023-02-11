//
//  Saving+CoreDataProperties.swift
//  Core-Data
//
//  Created by Александра Маслова on 10.02.2023.
//
//

import Foundation
import CoreData


extension Saving {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Saving> {
        return NSFetchRequest<Saving>(entityName: "Saving")
    }

    @NSManaged public var steps: String?
    @NSManaged public var amount: String?
    @NSManaged public var ingridients: String?
    @NSManaged public var category: String?
    @NSManaged public var timer: String?
    @NSManaged public var name: String?
    @NSManaged public var imageID: Data?

}

extension Saving : Identifiable {

}
