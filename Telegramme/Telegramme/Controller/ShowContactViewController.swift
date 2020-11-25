//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by shadow on 6/11/20.
//

import UIKit

class ShowContactViewController : UITableViewController {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let contactController:ContactController = ContactController()
    var contact_list : [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData() //refresh data
        
        if let contacts = contactController.retrieveAllContact() {
            contact_list = contacts
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact_list.count
    }
    
    override func tableView(_ tableView:UITableView , cellForRowAt indexPath :IndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contact_list[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.moblieNo)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Exercise 2
    override func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
                contact_list.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath],
                with: UITableView.RowAnimation.fade)
        }
    }

    //Exercise 3
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showContact"){
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let controller = segue.destination as! ContactDetailsViewController
                let value = contact_list[indexPath.row]
                controller.firstName = value.firstName
                controller.lastName = value.lastName
                controller.moblieNo = value.moblieNo
                controller.contactListIndex = indexPath.row
            }
        }
    }
    
    @IBAction func unwindToList(_ sender: UIStoryboardSegue){}
   
    
    
    
}
