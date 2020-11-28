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
        
        let friendObj = NSManagedObject(entity:friendEntity, insertInto: context)
        friendObj.setValue(friend.name , forKeyPath:"name")
        friendObj.setValue(friend.profileImageName , forKeyPath:"profileImageName")
        
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func AddMessageToFriend(friend : Friend, message : Message) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let messageEntity = NSEntityDescription.entity(forEntityName:"CDMessage", in:context)!
            
        do {
            let messageObject = NSManagedObject(entity:messageEntity, insertInto: context)
            messageObject.setValue(message.isSender , forKeyPath:"isSender")
            messageObject.setValue(message.text , forKeyPath:"text")
            messageObject.setValue(message.date , forKeyPath:"date")
            messageObject.setValue(friend , forKeyPath:"friend")
            
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retriveMessagesByFriend(friend:Friend) -> [Message]{
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDFriend")
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.name)
        
        var messages_list : [Message] = []
        do {
            let query = try context.fetch(fetchRequest)
            let friendObj = query[0] as! NSManagedObject
            
            let messages = friendObj.value(forKey: "message")
            for m in messages as! [NSManagedObject]{
                let message:Message = Message(text: m.value(forKey: "text") as! String, isSender: m.value(forKey: "isSender") as! Bool, date: m.value(forKey: "date") as! Date)
                messages_list.append(message)
            }
            return messages_list
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return []
        }
        
        
    }
    
    
}
