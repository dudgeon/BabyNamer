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
    
    init(_ adjective: String){
        self.adjective = adjective
    }
    
    static var list: [Adjective] = [
        Adjective("Smart"),
    ]
    
    static var random: Adjective {
        return list[Int(arc4random_uniform(UInt32(list.count)))]
    }
    
    
    static func populate(){
        let query = PFQuery(className: "Adjective")
        query.findObjectsInBackgroundWithBlock {
            (adjectives: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                // success!
                if let adjective = adjectives as [PFObject]! {
                    
                    for adjective in adjective {
                        print(adjective.objectId)
                        self.list.append(Adjective(adjective["adjective"] as! String))
                    }
                    
                }
                
            } else {
                
                // error!
                
            }
            
        } // end query.find
    }
    
}


