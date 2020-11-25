//
//  FriendController.swift
//  Telegramme
//
//  Created by shadow on 25/11/20.
//

import UIKit
import CoreData

//Contact CRUD
class FriendController {
    
    func AddFriend(friend:Friend)  {
    
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let friendEntity = NSEntityDescription.entity(forEntityName:"CDFriend", in:context)!
        
        let friend = NSManagedObject(entity:friendEntity, insertInto: context)
        friend.setValue(friend.name , forKeyPath:"name")
        friend.setValue(friend.profileImageName , forKeyPath:"profileImageName")
        
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func AddMessageToFriend(friend:Friend, message:Message) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let messageEntity = NSEntityDescription.entity(forEntityName:"CDMessage", in:context)!
        
        let message = NSManagedObject(entity:messageEntity, insertInto: context)
        message.setValue(message.isSender , forKeyPath:"isSender")
        message.setValue(message.text , forKeyPath:"text")
        message.setValue(message.date , forKeyPath:"date")
        message.setValue(friend , forKeyPath:"friend")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retriveMessagesByFriend(friend:Friend) -> [Message]{
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
    }
    
    
}
