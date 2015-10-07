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
    func showVote(){
        performSegueWithIdentifier("ShowVote", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // RETRIEVE NAMES
        let nameQuery = PFQuery(className: "Name")
        nameQuery.findObjectsInBackgroundWithBlock {
            (names: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                // success!
                if let names = names as [PFObject]! {
                    for name in names {
                        print(name.objectId)
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
        adjectiveQuery.findObjectsInBackgroundWithBlock {
            (adjectives: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                // success!
                if let adjective = adjectives as [PFObject]! {
                    
                    for adjective in adjective {
                        print(adjective.objectId)
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
