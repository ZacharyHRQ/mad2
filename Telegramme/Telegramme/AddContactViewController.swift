//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by shadow on 6/11/20.
//

import UIKit


class AddFriendViewController : UIViewController {
   
    
    @IBOutlet var firstNameFld: UITextField!
    @IBOutlet var lastNameFld: UITextField!
    @IBOutlet var mobileFld: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func cancelBtn(_ sender : Any){
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }

    @IBAction func createBtn(_ sender : Any){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //Excerise 1
        appDelegate.contactList.append(Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, moblieno: mobileFld.text!))
        print(String(appDelegate.contactList.count))
    }
}

