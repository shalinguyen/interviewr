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
    
    var id: String {return pfObject.objectId}
    var username: String {return pfObject.objectForKey("username") as String}
    var firstName: String {return pfObject.objectForKey("firstName") as String}
    var lastName: String {return pfObject.objectForKey("lastName") as String}
    var name: String {return "\(firstName) \(lastName)"}
    var email: String {return pfObject.objectForKey("email") as String}
    
    var pfObject: PFObject
    
    init(parseObject: PFObject) {
        pfObject = parseObject
    }
    
    class var current: User! {
        get {
            if (_currentUser == nil) {
                let data = NSUserDefaults.standardUserDefaults().objectForKey(_currentUserKey) as? NSData
                if (data != nil) {
                    let dictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSDictionary
                    let parseObject = PFUser()
                    parseObject.setValuesForKeysWithDictionary(dictionary)
                    parseObject.objectId = dictionary["objectId"] as String
                    _currentUser = User(parseObject: parseObject)
                }
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            func dictionary(user: User) -> NSDictionary {
                var d = user.pfObject.dictionaryWithValuesForKeys(user.pfObject.allKeys())
                d["objectId"] = user.id
                return d
            }
            let data = user != nil ? NSJSONSerialization.dataWithJSONObject(dictionary(user), options: nil, error: nil) : nil
            NSUserDefaults.standardUserDefaults().setObject(data, forKey: _currentUserKey)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}
