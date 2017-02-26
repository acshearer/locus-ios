//
//  EventCell.swift
//  Locus
//
//  Created by Vivek Mahendra on 2/26/17.
//  Copyright © 2017 Vivek Mahendra. All rights reserved.
//

import UIKit

class EventCell : UITableViewCell{
    
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var numberOfFriends: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI(event: Event){
        eventTitle.text = event.name
        eventLocation.text = event.location
        numberOfFriends.text = String(event.numberGoing)
        
    }
}
 
