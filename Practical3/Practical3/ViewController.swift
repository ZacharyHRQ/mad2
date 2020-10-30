//
//  ViewController.swift
//  Practical3
//
//  Created by shadow on 30/10/20.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
   
         
    @IBOutlet var myLBl: UILabel!       //Exercise 1
    
    
    @IBOutlet var txtField: UITextField!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtField.resignFirstResponder()
        myLBl.text = textField.text
        return true
    }
    
    //Exercise 2
    @IBAction func onClick(_ sender: UIButton) {
        //print("I'm Clicked!")
        myLBl.text = "Button has been clicked"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

