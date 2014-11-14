//
//  Candidate.swift
//  interview
//
//  Created by Bryan Pon on 11/14/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class Candidate: NSObject {
   
    var name: String {
        get {return pfObject.objectForKey("name") as String}
        set(v) {pfObject.setValue(v, forKey: "name")}
    }
    var linkedInUrl: String? {
        get {return pfObject.objectForKey("linkedInUrl") as? String}
        set(v) {pfObject.setValue(v, forKey: "linkedInUrl")}
    }
    
    var pfObject: PFObject
    
    init(parseObject: PFObject) {
        pfObject = parseObject
    }
}
