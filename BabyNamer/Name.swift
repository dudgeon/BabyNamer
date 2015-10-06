//
//  Name.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit
import Parse


struct Name {
    let name: String
    
    init(_ name: String){
        self.name = name
    }
    
    static var list: [Name] = [
        Name("Felix"),
    ]
    
    static var random: Name {
        return list[Int(arc4random_uniform(UInt32(list.count)))]
        
    }
    
    static func populate(){
        let query = PFQuery(className: "Name")
        query.findObjectsInBackgroundWithBlock {
            (names: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                // success!
                if let names = names as [PFObject]! {
                    for name in names {
                        print(name.objectId)
                        self.list.append(Name(name["name"] as! String))
                    }
                }
                
            } else {
                // error!
            }
        } // end query.find
    }

}


