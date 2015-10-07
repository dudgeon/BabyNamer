//
//  ViewController.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    
    // MODEL
    var currentBallot = Ballot()

    
    
    // VIEW
    @IBOutlet weak var candidateNameLabel: UILabel!
    @IBOutlet weak var candidateAdjectiveLabel: UILabel!
    
    
    // CONTROLLER
    @IBAction func randomize(sender: UIButton) {
        
        // increment counters
        countCurrentTaps++
        countSessionTaps++

        switch sender.currentTitle! {
            case "Yes":
                // register a Yes vote
                currentBallot = currentBallot.vote(associateNameWithAdjective: true)

            
            
            case "No":
                //register a No vote
                currentBallot = currentBallot.vote(associateNameWithAdjective: false)

                
            default:
                print("Sender.currentTitle is neither Yes or No")
        }
        
        // prepare the UI for with a new ballot
        candidateNameLabel.text = currentBallot.candidateName.name
        candidateAdjectiveLabel.text = currentBallot.candidateAdjective.adjective + "?"
        
        if countCurrentTaps == 10 {
            countCurrentTaps = 0
            performSegueWithIdentifier("DidYouKnow", sender: self)
        }
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentBallot = Ballot()
        candidateNameLabel.text = currentBallot.candidateName.name
        candidateAdjectiveLabel.text = currentBallot.candidateAdjective.adjective + "?"
    
//        name = Name.random.name
//        candidateNameLabel.text = name
//        
//        adjective = Adjective.random.adjective
//        candidateAdjectiveLabel.text = adjective + "?"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

