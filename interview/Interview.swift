//
//  Interview.swift
//  interview
//
//  Created by Bryan Pon on 10/16/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class Interview: NSObject {
    
    var id: String {return pfObject.objectId}
    var intervieweeName: String {return pfObject.objectForKey("intervieweeName") as String}
    var linkedinUrl: String? {return pfObject.objectForKey("linkedinUrl") as? String}
    var position: String {return pfObject.objectForKey("position") as String}
    var topic: String {return pfObject.objectForKey("topic") as String}
    var startDate: NSDate {return pfObject.objectForKey("startDate") as NSDate}
    var endDate: NSDate {return pfObject.objectForKey("endDate") as NSDate}
    var location: String? {return pfObject.objectForKey("location") as? String}
    
    var pfObject: PFObject
    
    init(parseObject: PFObject) {
        pfObject = parseObject
    }
}
