//
//  Adjective.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit
import Parse


struct Adjective {
    let adjective: String
    let adjectivePFObject: PFObject
    
    init(adjective: String, adjectivePFObject: PFObject){
        self.adjective = adjective
        self.adjectivePFObject = adjectivePFObject
    }
    
    static var list: [Adjective] = []
    
    static var random: Adjective {
        return list[Int(arc4random_uniform(UInt32(list.count)))]
    }
    
    
    
    
}


