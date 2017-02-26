//
//  Event.swift
//  Locus
//
//  Created by Vivek Mahendra on 2/26/17.
//  Copyright © 2017 Vivek Mahendra. All rights reserved.
//

import Foundation

class Event{
    
    private var _name: String!
    private var _location: String!
    private var _numberGoing: Int!
    
    
    var name: String{
        return name
    }
    
    var location: String{
        return location
    }
    
    var numberGoing: Int{
        return numberGoing
    }
    
    init(name:String,location:String,numberGoing:Int) {
        _name = name
        _location = location
        _numberGoing = numberGoing
    }
    
    
}
