//
//  Adjective.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit


struct Adjective {
    let adjective: String
    
    init(_ adjective: String){
        self.adjective = adjective
    }
    
    static var list: [Adjective] = [
        Adjective("Smart"),
        Adjective("Funny"),
        Adjective("Cruel"),
        Adjective("Wise"),
        Adjective("Patient"),
        Adjective("Kind"),
    ]
    
    static var random: Adjective {
        return list[Int(arc4random_uniform(UInt32(list.count)))]
    }
    
}


