//
//  ContactDetailsViewController.swift
//  Telegramme
//
//  Created by shadow on 7/11/20.
//

import UIKit

class ContactDetailsViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var moblieNoField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var firstName: String?
    var lastName: String?
    var moblieNo: String?
    var contactListIndex : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.text = firstName
        lastNameField.text = lastName
        moblieNoField.text = moblieNo
    }
    
    @IBAction func updateDetails(_ sender: UIButton) {
        let contact : Contact = appDelegate.contactList[contactListIndex!]
        contact.firstName = firstNameField.text!
        contact.lastName = lastNameField.text!
        contact.moblieNo = moblieNoField.text!
        self.dismiss(animated: true)
    }
    
    
}
