//
//  LoadingViewController.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/6/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit
import Parse

class LoadingViewController: UIViewController {
    
    // MODEL
    var namesReady: Bool = false
    var adjectivesReady: Bool = false
    @IBOutlet weak var nextButton: UIButton!
    
    // this method is called when (NAMES && ADJECTIVES) have finished loading
    func showVote(){
        
        // if user has already visited, segue them to the main screen
        if let firstVisit = defaults.stringForKey(defaultsKeys.keyOne) {
            if firstVisit == "false" {
                performSegueWithIdentifier("ShowVote", sender: self)
            }
        }
        
        // if not, enable the "Let's go!" button so they can take themselves
        nextButton.enabled = true
    }

    
    // VIEW
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var loadingLabel: UILabel!
    
    
    // CONTROLLER
    
    // if first visit: user taps "Let's go!" button, updates a localStorage value for firstVisit, segues them to the main screen
    @IBAction func nextButton(sender: AnyObject) {
        print("Let's go!")
        performSegueWithIdentifier("ShowVote", sender: self)
        
        // update firstVisit key: false
        defaults.setValue("false", forKey: defaultsKeys.keyOne)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CHECK FOR FIRST VISIT
        if let firstVisit = defaults.stringForKey(defaultsKeys.keyOne) {
            if firstVisit == "false" {
                nextButtonOutlet.hidden = true
                loadingLabel.hidden = false
            }
        }
        

        // RETRIEVE NAMES -- launches background operation
        let nameQuery = PFQuery(className: "Name")
        nameQuery.cachePolicy = .CacheThenNetwork // caching per Parse docs https://www.parse.com/docs/ios/guide#queries-caching-queries
        nameQuery.findObjectsInBackgroundWithBlock {
            (names: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                // success!
                Name.list = []
                if let names = names as [PFObject]! {
                    for name in names {
                        Name.list.append(Name(name["name"] as! String))
                    }
                }
                self.namesReady = true
                if self.adjectivesReady { self.showVote() } else { print("Waiting for Adjectives...") } // if NAMES is last, execute segue option
                
            } else {
                // error!
            }
        } // end Retrieve:Names
        
        
        // RETRIEVE ADJECTIVES
        let adjectiveQuery = PFQuery(className: "Adjective")
        adjectiveQuery.cachePolicy = .CacheThenNetwork
        adjectiveQuery.findObjectsInBackgroundWithBlock {
            (adjectives: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                // success!
                Adjective.list = []
                if let adjective = adjectives as [PFObject]! {
                    
                    for adjective in adjective {
                        Adjective.list.append(Adjective(adjective["adjective"] as! String))
                    }
                }
                self.adjectivesReady = true
                if self.namesReady { self.showVote() } else { print("Waiting for Names...") } // if ADJECTIVES is last, execute segue option
                
            } else {
                
                // error!
            }
            
        } // end Retrieve:Adjectives
        
        
        
        
        
        
        
    }

}
