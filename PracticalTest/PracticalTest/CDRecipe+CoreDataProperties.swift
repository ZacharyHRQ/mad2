//
//  CDRecipe+CoreDataProperties.swift
//  PracticalTest
//
//  Created by shadow on 9/12/20.
//
//

import Foundation
import CoreData


extension CDRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDRecipe> {
        return NSFetchRequest<CDRecipe>(entityName: "CDRecipe")
    }

    @NSManaged public var name: String?
    @NSManaged public var preparationTime: Int16
    @NSManaged public var ingredient: CDIngredient?

}

extension CDRecipe : Identifiable {

}
