//
//  Adjective.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit


struct Adjective {
//    let adjective: String
//    init(adjective: String){
//        self.adjective = adjective
//    }
    
    static var list: [String] = [
        "Smart",
        "Funny",
        "Cruel",
        "Wise",
        "Patient",
        "Kind",        
    ]
    
    static var random: String {
        return list[Int(arc4random_uniform(UInt32(list.count)))]
    }
    
    static var randomQ: String {
        return self.random + "?"
    }
    
}


