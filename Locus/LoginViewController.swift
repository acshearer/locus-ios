//
//  ViewController.swift
//  Locus
//
//  Created by Vivek Mahendra on 2/25/17.
//  Copyright © 2017 Vivek Mahendra. All rights reserved.
//

import UIKit
import Google

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var subHeading: UILabel!
    @IBOutlet weak var Heading: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var loginSuccess: UILabel!
    
    var userEmail = String()
    var userName = String()
    var userImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var error: NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil{
            print(error)
            return
        }
        
        
        continueButton.layer.cornerRadius=8
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil{
            print(error)
            return
        }
        print(user.profile.email)
        print(user.profile.name)
        
        userEmail = user.profile.email
        userName = user.profile.name

        signInButton.isHidden = true
        subHeading.isHidden = true
        Heading.isHidden = true
        continueButton.isHidden = false
        loginSuccess.isHidden=false
        background.backgroundColor=UIColor.gray
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination : UserViewController = segue.destination as! UserViewController
        destination.userEmailText  = userEmail
        destination.userNameText = userName
    }
    



}

 
