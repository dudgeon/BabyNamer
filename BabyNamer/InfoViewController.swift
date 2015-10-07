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
        "92% of people think \"Zoe\" sounds \"Smelly\"!",
        "Bears can smell fear!",
        "Sharks can't swim backwards!",
        "Super Moon!",
        "Helium is lighter than air!",
        "The north pole is in Canada!",
        "The highest temperature on Mars is about 70 degrees fahrenheit!"
        
    ]
    
    // VIEW
    @IBOutlet weak var middleLabel: UILabel!
    
    // CONTROLLER
    @IBAction func gameOn(sender: AnyObject) {
        
        performSegueWithIdentifier("GameOn", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomTriviaItem = arrayOfTriviaItems[Int(arc4random_uniform(UInt32(arrayOfTriviaItems.count)))]
        middleLabel.text = randomTriviaItem

        // Do any additional setup after loading the view.
    }



}
