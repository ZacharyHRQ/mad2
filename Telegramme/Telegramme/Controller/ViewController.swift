//
//  ViewController.swift
//  Telegramme
//
//  Created by shadow on 6/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usrNameFld: UITextField!
    @IBOutlet var pwdFld: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtn(_ sender: UIButton) {
        if true {
            let storyboard = UIStoryboard(name:"Content" , bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Content") as UIViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
}

