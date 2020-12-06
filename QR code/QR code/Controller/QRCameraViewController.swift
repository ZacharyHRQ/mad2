//
//  QRCameraViewController.swift
//  QR code
//
//  Created by shadow on 6/12/20.
//

import UIKit
import QRCoder

class QRCameraViewController: QRCodeScannerViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func processQRCodeContent(qrCodeContent: String) -> Bool {
        let alert = UIAlertController(title: "Alert", message: qrCodeContent, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
            return true
    }
    
    

}
