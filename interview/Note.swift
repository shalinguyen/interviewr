//
//  Note.swift
//  interview
//
//  Created by Bryan Pon on 11/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class Note: NSObject {
    
    var content: String
    var dateCreated: NSDate
    //var createdBy: User
    
    init(parseObject: PFObject) {
        content = parseObject.objectForKey("content") as String
        dateCreated = parseObject.objectForKey("dateCreated") as NSDate
    }
}
