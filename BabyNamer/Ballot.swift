//
//  Ballot.swift
//  BabyNamer
//
//  Created by Geoffrey Dudgeon on 10/6/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import Swift

struct Ballot {
    let candidateName: Name
    let candidateAdjective: Adjective
    var associateNameWithAdjective: Bool?

    // Ballots automatically randomize on creation
    init(){
        self.candidateName = Name.random
        self.candidateAdjective = Adjective.random
    }
    
    // let the controller vote
    mutating func vote(associateNameWithAdjective associate: Bool) -> Ballot {
        self.associateNameWithAdjective = associate
        
        Ballot.votes.append(self)
        
        // just for testing...
        print("Vote | name: \(self.candidateName.name), adjective:\(self.candidateAdjective.adjective), associate:\(self.associateNameWithAdjective)")
        print(Ballot.votes)
        
        return Ballot()
    }
    
    
    // keep a list of votes
    static var votes: [Ballot] = []
    

}
