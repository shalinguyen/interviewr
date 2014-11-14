//
//  User.swift
//  interview
//
//  Created by Bryan Pon on 11/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

var _currentUser: User!
var _currentUserKey = "currentUser"

class User: NSObject {
    
    var id: String
    var username: String
    var firstName: String
    var lastName: String
    var email: String
    
    var dictionary: NSDictionary //For serializing to local storage
    
    init(parseObject: PFObject) {
        id = parseObject.objectId
        username = parseObject.objectForKey("username") as String
        firstName = parseObject.objectForKey("firstName") as String
        lastName = parseObject.objectForKey("lastName") as String
        email = parseObject.objectForKey("email") as String
        
        var d = parseObject.dictionaryWithValuesForKeys(parseObject.allKeys())
        d["objectId"] = id
        dictionary = d
    }
    
    private init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        id = dictionary["objectId"] as String
        username = dictionary["username"] as String
        firstName = dictionary["firstName"] as String
        lastName = dictionary["lastName"] as String
        email = dictionary["email"] as String
    }
    
    class var current: User! {
        get {
            if (_currentUser == nil) {
                let data = NSUserDefaults.standardUserDefaults().objectForKey(_currentUserKey) as? NSData
                if (data != nil) {
                    let dictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            let data = user != nil ? NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: nil, error: nil) : nil
            NSUserDefaults.standardUserDefaults().setObject(data, forKey: _currentUserKey)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}
