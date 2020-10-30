//
//  ViewController.swift
//  Practical2
//
//  Created by shadow on 24/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Exercise 1
        let john = Friend(firstname: "john",lastname: "tan",age: 28)
        let mary = Friend(firstname: "mary",lastname: "tan",age: 18)
        let bob = Friend(firstname: "bob",lastname: "tan",age: 25)
        let jack = Friend(firstname: "jack",lastname: "tan",age: 16)
        let chris = Friend(firstname: "chris",lastname: "tan",age: 70)
        
        let friendsList:[Friend] = [john,mary,bob,jack,chris]
        
        //Exercise 2
        
        func displayFriends(friends:[Friend]){
            for friend in friends{
                print("\(friend.firstName)  \(friend.lastName) is \(friend.age) years old")
            }
        }
        
        displayFriends(friends: friendsList)
        
        //Exercise 3
        
        func displayFriendsUnder20(friends:[Friend]){
            for friend in friends{
                if friend.age < 20 {
                    print(friend.firstName)
                }
            }
        }
        
        displayFriendsUnder20(friends:  friendsList)
        
        //Exercise 4
        
        func findAverageAge(friends:[Friend]) -> Double{
            var sum:Double = 0.0
            for friend in friends{
                sum += Double(friend.age)
            }
            return sum/Double(friends.count)
        }
        
        print(findAverageAge(friends: friendsList))
        
    }


}

