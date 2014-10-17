//
//  ParseClient.swift
//  interview
//
//  Created by Bryan Pon on 10/16/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class ParseClient {
    
    class func getNextInterview(success: Interview -> Void, failure: (NSError -> Void)? = nil) {
        let query = PFQuery(className: "Interview")
        //TODO Get next upcoming interview for today instead of first object
        query.getFirstObjectInBackgroundWithBlock { (obj: PFObject!, error: NSError!) -> Void in
            if (error == nil) {
                let interview = Interview(parseObject: obj)
                success(interview)
            } else {
                println(error)
                if (failure != nil) {
                    failure!(error)
                }
            }
        }
    }
}
