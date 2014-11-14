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
    var title: String {
        get {return pfObject.objectForKey("title") as String}
        set(v) {pfObject.setValue(v, forKey: "title")}
    }
    var organization: String {return pfObject.objectForKey("organization") as String}
    var descriptionText: String {
        get {return pfObject.objectForKey("description") as String}
        set(v) {pfObject.setValue(v, forKey: "description")}
    }
    
    var pfObject: PFObject
    
    init(parseObject: PFObject) {
        pfObject = parseObject
    }
    
    convenience init(title: String, descriptionText: String) {
        self.init(parseObject: PFObject(className: "JobDescription", dictionary: [
            "title": title,
            "organization": "", //TODO
            "description": descriptionText
        ]))
    }
}
