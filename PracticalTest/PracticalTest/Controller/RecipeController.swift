//
//  RecipeController.swift
//  PracticalTest
//
//  Created by shadow on 9/12/20.
//

import UIKit
import CoreData
import Foundation

class RecipeController {
    
    func AddRecipe(name:String , prepation : Int16 , ingredients:[String] , time:Date){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let recipeEntity = NSEntityDescription.entity(forEntityName:"CDRecipe", in:context)!
        let recipe = CDRecipe(entity:recipeEntity, insertInto: context)
        recipe.setValue(name , forKeyPath:"name")
        recipe.setValue(prepation , forKeyPath:"preparationTime")
        recipe.setValue(time, forKey: "timeCreated")
        
        for i in ingredients{
            guard i != "" else {
                return
            }
            let ingredientEntity = NSEntityDescription.entity(forEntityName:"CDIngredient", in:context)!
            let ingredient = CDIngredient(entity:ingredientEntity, insertInto: context)
            ingredient.setValue(i , forKeyPath:"name")
            recipe.addToIngredient(ingredient)
        }
                
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    func retrieveAllRecipe() -> [CDRecipe]? {
        var recipes:[CDRecipe] = []
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CDRecipe>(entityName: "CDRecipe")
        do {
            recipes = try context.fetch(fetchRequest)
            return recipes
        } catch let error as NSError {
               print("Could not save. \(error) , \(error.userInfo)")
               return nil
        }
           

    }
}
