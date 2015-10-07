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
    func showVote(){
        // performSegueWithIdentifier("ShowVote", sender: self)
        nextButton.enabled = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // RETRIEVE NAMES
        let nameQuery = PFQuery(className: "Name")
        nameQuery.cachePolicy = .CacheThenNetwork
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
                if self.adjectivesReady { self.showVote() } else { print("Waiting for Adjectives...") }
                
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
                if self.namesReady { self.showVote() } else { print("Waiting for Names...") }
                
            } else {
                
                // error!
            }
            
        } // end Retrieve:Adjectives
        
        
        
        
        
        
        
    }

}
