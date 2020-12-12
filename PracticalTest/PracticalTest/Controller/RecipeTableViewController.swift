//
//  RecipeTableViewController.swift
//  PracticalTest
//
//  Created by shadow on 8/12/20.
//

import UIKit

class RecipeTableViewController : UITableViewController {

    let recipeController:RecipeController = RecipeController()
    var recipes_list : [CDRecipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.reloadData()
        
        if let recipes = recipeController.retrieveAllRecipe(){
            recipes_list = recipes
        }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.tableView.reloadData()
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return recipes_list.count
    }
        
    override func tableView(_ tableView:UITableView , cellForRowAt indexPath :IndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)

        let recipe:CDRecipe = recipes_list[indexPath.row]
        var str:String = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_SG")
        
        guard let ingredients = recipe.ingredient?.allObjects as? [CDIngredient] else {
            return cell
        }
        
        for ingredient in ingredients {
            str += "[ " + ingredient.name! + " ]"
        }
        
        cell.textLabel!.text = recipe.name! + " (\(recipe.preparationTime)) \(dateFormatter.string(from: recipe.timeCreated!))"
        cell.detailTextLabel!.text = str
    
        return cell
    }
    
        
        
    
       

}

