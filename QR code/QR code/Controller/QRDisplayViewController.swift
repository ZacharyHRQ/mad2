//
//  QRDisplayViewController.swift
//  QR code
//
//  Created by shadow on 6/12/20.
//


import UIKit
import QRCoder

class QRDisplayViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var QRCode: UIImageView!
    @IBOutlet var myUrl: UITextField!
    
    let generator = QRCodeGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myUrl.delegate = self
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let url = textField.text!
        QRCode.image = generator.createImage(value: url, size: CGSize(width: 300,height: 300))
        return true
    }
    
    


}
