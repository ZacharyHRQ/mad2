//
//  ContactController.swift
//  Telegramme
//
//  Created by shadow on 24/11/20.
//

import UIKit
import CoreData

class ContactController {
    //let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    
    func AddContact(newContact : Contact)  {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        
        let contact = NSManagedObject(entity: entity, insertInto: context)
        contact.setValue(newContact.firstName, forKeyPath: "firstname")
        contact.setValue(newContact.lastName, forKeyPath: "lastname")
        contact.setValue(newContact.moblieNo, forKeyPath: "moblieno")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error) , \(error.userInfo)")
        }
    }
    
    func retrieveAllContact() -> [Contact]? {
        var contacts:[NSManagedObject] = []
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        var contacts_list:[Contact] = []
        do {
            
            contacts = try context.fetch(fetchRequest)
            for c in contacts{
                let firstname = c.value(forKeyPath: "firstname") as! String
                let lastname = c.value(forKeyPath: "lastname") as! String
                let moblieno = c.value(forKeyPath: "moblieno") as! String
                contacts_list.append(Contact(firstname: firstname , lastname: lastname, moblieno: moblieno))
            }
            return contacts_list
        } catch let error as NSError {
            print("Could not save. \(error) , \(error.userInfo)")
            return nil
        }
        
        
    }

    func updateContact(moblieno:String , newContact:Contact) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "moblieno = %@", moblieno)
        
        do {
            let contacts = try context.fetch(fetchRequest)
            
            let contact = contacts[0] as! NSManagedObject
            contact.setValue(newContact.firstName, forKey: "firstname")
            contact.setValue(newContact.lastName, forKey: "lastname")
            contact.setValue(newContact.moblieNo, forKey: "moblieno")
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error) , \(error.userInfo)")
            }
            
        } catch let error as NSError {
            print("Could not save. \(error) , \(error.userInfo)")
        }
    }
    
    func deleteContact(moblieno:String) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "moblieno = %@", moblieno)
        
        do {
            let contacts = try context.fetch(fetchRequest)
            let contact = contacts[0] as! NSManagedObject
            context.delete(contact)
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error) , \(error.userInfo)")
            }
            
        } catch let error as NSError {
            print("Could not save. \(error) , \(error.userInfo)")
        }
    
    }
}


