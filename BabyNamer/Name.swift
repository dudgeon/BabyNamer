//
//  Name.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit


struct Name {
//    let name: String
//    init(name: String){
//        self.name = name
//    }
    
    static var list: [String] = [
        "Felix",
        "Oliver",
        "Simon",
        "Amelia",
        "Ben",
        "Michael",
    ]
    
    static var random: String {
        return list[Int(arc4random_uniform(UInt32(list.count)))]
    }

}


