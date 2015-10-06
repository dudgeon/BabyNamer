//
//  Ballot.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/6/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import Swift
import Parse

struct Ballot {
    let candidateName: Name
    let candidateAdjective: Adjective
    var associateNameWithAdjective: Bool?
    let parseBallot = PFObject(className: "ParseVote")

    // Ballots automatically randomize on creation
    init(){
        let name = Name.random
        self.candidateName = name
        self.parseBallot["name"] = name.name
        
        let adjective = Adjective.random
        self.candidateAdjective = adjective
        self.parseBallot["adjective"] = adjective.adjective
    }
    
    // let the controller vote
    mutating func vote(associateNameWithAdjective associate: Bool) -> Ballot {

        // add the association (Bool) to the existing ballot
        self.associateNameWithAdjective = associate
        self.parseBallot["associate"] = associate
        self.parseBallot["test"] = true // REMOVE before production
        
        // Save to Parse
        self.parseBallot.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        }
        
        Ballot.votes.append(self)
        
        // generate and return a new Ballot
        return Ballot()
    }
    
    
    // keep a list of votes -- REMOVE?
    static var votes: [Ballot] = []
    

}
