//
//  Interview.swift
//  interview
//
//  Created by Bryan Pon on 10/16/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class Interview: NSObject {
    
    var candidate: Candidate
    var jobDescription: JobDescription
    
    var id: String {return pfObject.objectId}
    var intervieweeName: String {return candidate.name}
    var linkedInUrl: String? {return candidate.linkedInUrl}
    var position: String {return jobDescription.title}
    var topic: String {return pfObject.objectForKey("topic") as String}
    var startDate: NSDate {return pfObject.objectForKey("startDate") as NSDate}
    var endDate: NSDate {return pfObject.objectForKey("endDate") as NSDate}
    var location: String? {return pfObject.objectForKey("location") as? String}
    
    var pfObject: PFObject
    
    init(parseObject: PFObject) {
        pfObject = parseObject
        candidate = Candidate(parseObject: parseObject.objectForKey("candidate") as PFObject)
        jobDescription = JobDescription(parseObject: parseObject.objectForKey("jobDescription") as PFObject)
    }
}
