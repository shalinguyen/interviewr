//
//  ParseClient.swift
//  interview
//
//  Created by Bryan Pon on 10/16/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class ParseClient {
    
    private class func handleObjectResponse<O, T>(obj: O!, error: NSError!, success: T! -> (), failure: (NSError -> ())?, deserialize: O -> T) {
        if (obj != nil) {
            success(deserialize(obj))
        } else if (error != nil) {
            success(nil)
        } else {
            println(error)
            if (failure != nil) {
                failure!(error)
            }
        }
    }
    
    private class func handleObjectResponse<O, T>(objs: [O]!, error: NSError!, success: [T] -> (), failure: (NSError -> ())?, deserialize: O -> T) {
        if (objs != nil) {
            success(objs.map({deserialize($0)}))
        } else if (error != nil) {
            success([])
        } else {
            println(error)
            if (failure != nil) {
                failure!(error)
            }
        }
    }
    
    class func getNextInterview(success: Interview! -> (), failure: (NSError -> ())? = nil) {
        let query = PFQuery(className: "Interview")
        //TODO Get next upcoming interview for today instead of first object
        query.getFirstObjectInBackgroundWithBlock { (obj: PFObject!, error: NSError!) -> () in
            self.handleObjectResponse(obj, error: error, success: success, failure: failure) {Interview(parseObject: $0)}
        }
    }
    
    class func getUserById(id: String, success: User! -> (), failure: (NSError -> ())? = nil) {
        let query = PFUser.query()
        query.getObjectInBackgroundWithId(id, block: { (obj: PFObject!, error: NSError!) -> () in
            self.handleObjectResponse(obj, error: error, success: success, failure: failure) {User(parseObject: $0)}
        })
    }
    
    class func getUserByUsername(username: String, success: User! -> (), failure: (NSError ->())? = nil) {
        let query = PFUser.query()
        query.whereKey("username", equalTo: username)
        query.getFirstObjectInBackgroundWithBlock { (obj: PFObject!, error: NSError!) -> Void in
            self.handleObjectResponse(obj, error: error, success: success, failure: failure) {User(parseObject: $0)}
        }
    }
    
    class func getNotesByUser(userId: String, success: [Note] -> (), failure: (NSError -> ())? = nil) {
        let query = PFQuery(className: "Note")
        query.whereKey("createdById", equalTo: userId)
        query.findObjectsInBackgroundWithBlock { (objs: [AnyObject]!, error: NSError!) -> Void in
            self.handleObjectResponse(objs, error: error, success: success, failure: failure) {Note(parseObject: $0 as PFObject)}
        }
    }
}
