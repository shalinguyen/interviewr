//
//  Interview.swift
//  interview
//
//  Created by Bryan Pon on 10/16/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class Interview: NSObject {
    
    var id: String
    var intervieweeName: String
    var linkedinUrl: String?
    var position: String
    var topic: String
    var startDate: NSDate
    var endDate: NSDate
    var location: String?
    
    init(parseObject: PFObject) {
        id = parseObject.objectId
        intervieweeName = parseObject.objectForKey("intervieweeName") as String
        linkedinUrl = parseObject.objectForKey("linkedinUrl") as? String
        position = parseObject.objectForKey("position") as String
        topic = parseObject.objectForKey("topic") as String
        startDate = parseObject.objectForKey("startDate") as NSDate
        endDate = parseObject.objectForKey("endDate") as NSDate
        location = parseObject.objectForKey("location") as? String
    }
}
