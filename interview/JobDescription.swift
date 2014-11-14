//
//  JobDescription.swift
//  interview
//
//  Created by Bryan Pon on 11/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class JobDescription: NSObject {
    
    var id: String {return pfObject.objectId}
    var title: String {return pfObject.objectForKey("title") as String}
    var organization: String {return pfObject.objectForKey("organization") as String}
    var descriptionText: String {return pfObject.objectForKey("description") as String}
    
    var pfObject: PFObject
    
    init(parseObject: PFObject) {
        pfObject = parseObject
    }
}
