//
//  ViewController.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MODEL
    var name: String = ""
    var adjective: String = ""
    
    
    // VIEW
    @IBOutlet weak var candidateName: UILabel!
    @IBOutlet weak var candidateAdjective: UILabel!
    
    
    // CONTROLLER
    @IBAction func randomize(sender: UIButton) {
        
        switch sender.currentTitle! {
            case "Yes":
                // register a Yes vote
                print("Yes vote: \(name) == \(adjective)")
                
            case "No":
                //register a No vote
                print("No vote: \(name) != \(adjective)")
                
            default:
                print("Sender.currentTitle is neither Yes or No")
        }
        
        name = Name.random
        candidateName.text = name
        
        adjective = Adjective.random
        candidateAdjective.text = adjective + "?"
        
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        name = Name.random
        candidateName.text = name
        
        adjective = Adjective.random
        candidateAdjective.text = adjective + "?"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

