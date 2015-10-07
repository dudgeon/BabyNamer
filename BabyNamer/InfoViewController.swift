//
//  InfoViewController.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/6/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    // MODEL
    let arrayOfTriviaItems = [
        
    ]
    
    // VIEW
    
    // CONTROLLER
    @IBAction func gameOn(sender: AnyObject) {
        
        performSegueWithIdentifier("GameOn", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
