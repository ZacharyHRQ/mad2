//
//  Friend.swift
//  Practical2
//
//  Created by zachary on 24/10/20.
//

import Foundation

class Friend {
    var firstName:String = ""
    var lastName:String = ""
    var age:Int = 0
    var description:String = ""
    
    init(firstname:String,lastname:String,age:Int) {
        self.firstName = firstname
        self.lastName = lastname
        self.age = age
    }
    
}
