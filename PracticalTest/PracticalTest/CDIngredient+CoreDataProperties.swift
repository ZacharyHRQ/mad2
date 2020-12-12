//
//  CDIngredient+CoreDataProperties.swift
//  PracticalTest
//
//  Created by shadow on 9/12/20.
//
//

import Foundation
import CoreData


extension CDIngredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDIngredient> {
        return NSFetchRequest<CDIngredient>(entityName: "CDIngredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var recipe: CDRecipe?

}

extension CDIngredient : Identifiable {

}
