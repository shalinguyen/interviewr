//
//  Note.swift
//  interview
//
//  Created by Bryan Pon on 11/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class Note: NSObject {
    
    var createdBy: User
    
    var content: String {return pfObject.objectForKey("content") as String}
    var dateCreated: NSDate {return pfObject.createdAt}
    
    var pfObject: PFObject
    
    init(parseObject: PFObject) {
        pfObject = parseObject
        createdBy = User(parseObject: parseObject.objectForKey("createdBy") as PFObject)
    }
    
    convenience init(interview: Interview, content: String) {
        self.init(parseObject: PFObject(className: "Note", dictionary: [
            "interview": PFObject(withoutDataWithClassName: "Interview", objectId: interview.pfObject.objectId),
            "content": content,
            "createdBy": PFUser(withoutDataWithObjectId: User.current.pfObject.objectId)
        ]))
    }
}
