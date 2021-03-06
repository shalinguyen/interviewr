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
        } else if (error == nil) {
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
            println("\(objs.count) item(s) returned")
            success(objs.map({deserialize($0)}))
        } else if (error == nil) {
            success([])
        } else {
            println(error)
            if (failure != nil) {
                failure!(error)
            }
        }
    }
    
    private class func handleSaveResponse(successful: Bool, error: NSError!, success: () -> (), failure: (NSError -> ())?) {
        if (successful) {
            success()
        } else if (error != nil) {
            println(error)
            if (failure != nil) {
                failure!(error)
            }
        }
    }
    
    class func getNextInterview(success: Interview! -> (), failure: (NSError -> ())? = nil) {
        let query = PFQuery(className: "Interview")
        query.includeKey("candidate")
        query.includeKey("jobDescription")
        query.whereKey("interviewer", containedIn: [PFUser(withoutDataWithObjectId: User.current.pfObject.objectId)])
        query.whereKey("startDate", greaterThan: NSDate())
        query.orderByAscending("startDate")
        query.getFirstObjectInBackgroundWithBlock { (obj: PFObject!, error: NSError!) -> () in
            self.handleObjectResponse(obj, error: error, success: success, failure: failure) {Interview(parseObject: $0)}
        }
    }
    
    class func getUpcomingInterviews(success: [Interview] -> (), failure: (NSError -> ())? = nil) {
        let query = PFQuery(className: "Interview")
        query.includeKey("candidate")
        query.whereKey("interviewer", containedIn: [PFUser(withoutDataWithObjectId: User.current.pfObject.objectId)])
        query.whereKey("startDate", greaterThan: NSDate())
        query.orderByAscending("startDate")
        query.findObjectsInBackgroundWithBlock { (objs: [AnyObject]!, error: NSError!) -> Void in
            self.handleObjectResponse(objs, error: error, success: success, failure: failure) {Interview(parseObject: $0 as PFObject)}
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
    
    class func getNotesByInterview(interview: Interview, success: [Note] -> (), failure: (NSError -> ())? = nil) {
        let query = PFQuery(className: "Note")
        query.includeKey("createdBy")
        query.whereKey("interview", containedIn: [interview.pfObject])
        query.findObjectsInBackgroundWithBlock { (objs: [AnyObject]!, error: NSError!) -> Void in
            self.handleObjectResponse(objs, error: error, success: success, failure: failure) {Note(parseObject: $0 as PFObject)}
        }
    }
    
    class func saveNote(note: Note, success: () -> (), failure: (NSError -> ())? = nil) {
        note.pfObject.saveInBackgroundWithBlock { (successful: Bool, error: NSError!) -> Void in
            self.handleSaveResponse(successful, error: error, success: success, failure: failure)
        }
    }
    
    class func saveJobDescription(jobDescription: JobDescription, success: () -> (), failure: (NSError -> ())? = nil) {
        jobDescription.pfObject.saveInBackgroundWithBlock { (successful: Bool, error: NSError!) -> Void in
            self.handleSaveResponse(successful, error: error, success: success, failure: failure)
        }
    }
}
