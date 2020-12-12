//
//  AddRecipeViewController.swift
//  PracticalTest
//
//  Created by shadow on 8/12/20.
//

import UIKit

class AddRecipeViewController : UIViewController {

    @IBOutlet var txtTitle: UITextField!
    @IBOutlet var txtPreparationTime: UITextField!
    
    @IBOutlet var txtIngredient1: UITextField!
    @IBOutlet var txtIngredient2: UITextField!
    @IBOutlet var txtIngredient3: UITextField!
    @IBOutlet var txtIngredient4: UITextField!
    @IBOutlet var txtIngredient5: UITextField!
    
    let recipeController:RecipeController = RecipeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAdd(_ sender: Any) {
        if (txtTitle.text!.isEmpty || txtPreparationTime.text!.isEmpty){
            showEmptyAlert(message: "Please populate the title and preparation time")
        }
        else if(txtIngredient1.text!.isEmpty && txtIngredient2.text!.isEmpty && txtIngredient3.text!.isEmpty && txtIngredient4.text!.isEmpty && txtIngredient5.text!.isEmpty){
            showEmptyAlert(message: "Please add at least one ingredient")
        }
        else{
            
            let date = Date().addingTimeInterval(1000)
            
            let t1:String = txtIngredient1.text!
            let t2:String = txtIngredient2.text!
            let t3:String = txtIngredient3.text!
            let t4:String = txtIngredient4.text!
            let t5:String = txtIngredient5.text!
            let ingredients:[String] = [t1,t2,t3,t4,t5]
            recipeController.AddRecipe(name: txtTitle.text!, prepation: Int16(txtPreparationTime.text!) ?? 0, ingredients: ingredients , time: date)
            if let navController = self.navigationController{
                navController.popViewController(animated: true)
            }
        }
        
        
    }
    
    func showEmptyAlert(message : String) {
        let alert = UIAlertController(title: "My Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

