//
//  LocalStore.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/6/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit

// using NSUserDefaults from http://stackoverflow.com/questions/28628225/how-do-you-save-local-storage-data-in-a-swift-application

struct defaultsKeys {
    static let keyOne = "firstVisit"
    static let keyTwo = "userUnique"
}

let defaults = NSUserDefaults.standardUserDefaults()

var countCurrentTaps = 0
var countSessionTaps = 0
// var countUserTaps = 0 // use local storage

let sessionUnique = NSUUID().UUIDString
var userUnique: String = ""


