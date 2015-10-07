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
    
    static var list: [Name] = []
    
    static var random: Name {
        return list[Int(arc4random_uniform(UInt32(list.count)))]
        
    }
}


