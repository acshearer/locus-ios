//
//  MainViewController.swift
//  Locus
//
//  Created by Vivek Mahendra on 2/26/17.
//  Copyright © 2017 Vivek Mahendra. All rights reserved.
//

import Foundation
import UIKit
import Google
import Alamofire

class UserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var events = [Event]()
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var coverPhoto: UIImageView!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var signOutbtn: UIButton!
    
    @IBAction func signOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        print("User signed out")
    }
    
    var userNameText = String()
    var userEmailText = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //let event1 = Event(name: "DevilPalooza", location: "SunDevil Field", numberGoing: 8)
        //let event2 = Event(name: "DevilPalooza", location: "SunDevil Field", numberGoing: 8)
        //let event3 = Event(name: "DevilPalooza", location: "SunDevil Field", numberGoing: 8)
        //let event4 = Event(name: "DevilPalooza", location: "SunDevil Field", numberGoing: 8)
        //let event5 = Event(name: "DevilPalooza", location: "SunDevil Field", numberGoing: 8)
        //let event6 = Event(name: "DevilPalooza", location: "SunDevil Field", numberGoing: 8)
        
        //JSON Attempt
        Alamofire.request("https://locus.chickenkiller.com/findeventall", method: .post).responseJSON { response in
            print(response.request!)  // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        //
        
        userName.text = userNameText
        userEmail.text = userEmailText
        
        
        profilePhoto.layer.cornerRadius = self.profilePhoto.frame.size.width/2
        signOutbtn.layer.cornerRadius = 4
        profilePhoto.image=#imageLiteral(resourceName: "icon_placeholder")
        coverPhoto.image=#imageLiteral(resourceName: "cover_photo_placeholder")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination : LoginViewController = segue.destination as! LoginViewController
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventCell {
            
            let event = events[indexPath.row]
            cell.updateUI(event: event)
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
        
    }
    
    }
