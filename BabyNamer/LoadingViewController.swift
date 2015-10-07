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
            
            // REPEAT VISIT
            if firstVisit == "false" {
                
                print("Not first visit!")
                
                // Prepare the UI for repeat visitor
                nextButtonOutlet.hidden = true
                loadingLabel.hidden = false
                
                // Retrieve UserUnique
                if let tempUserUnique = defaults.stringForKey(defaultsKeys.keyTwo) {
                    userUnique = tempUserUnique
                }
            }
        }
        // FIRST VISIT (or purged user settings)
        else {
            
            print("First visit!")
            
            // Generate a userUnique UUID
            userUnique = NSUUID().UUIDString
            
            defaults.setValue(userUnique, forKey: defaultsKeys.keyTwo)
        }
        
        
        
        

        // RETRIEVE NAMES -- launches background operation
        let nameQuery = PFQuery(className: "Name")
        nameQuery.cachePolicy = .CacheThenNetwork // caching per Parse docs https://www.parse.com/docs/ios/guide#queries-caching-queries
        nameQuery.findObjectsInBackgroundWithBlock {
            (parseNames: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                // success!
                Name.list = []
                if let parseNames = parseNames as [PFObject]! {
                    for parseName in parseNames {
                        
                        let name = Name(name: parseName["name"] as! String, namePFObject: parseName)
                        print("Name: \(name.name), ObjectId: \(name.namePFObject.objectId!)")
                        
                        Name.list.append(name)
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
            (parseAdjectives: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                // success!
                Adjective.list = []
                if let parseAdjective = parseAdjectives as [PFObject]! {
                    
                    for parseAdjective in parseAdjective {
                        
                        let adjective = Adjective(adjective: parseAdjective["adjective"] as! String, adjectivePFObject: parseAdjective)
                        Adjective.list.append(adjective)
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
